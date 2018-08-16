# Maintainer: klardotsh <josh@klar.sh>

pkgname=tuijam
pkgver=0.2.8
pkgrel=1
_pkgcommit='dd60ff0f1bb4f167706e977a046d6f10c3bad246'
pkgdesc=" A fancy TUI client for Google Play Music"
url="https://github.com/cfangmeier/tuijam"
arch=(any)
license=('MIT')
depends=(
	'python'
	'python-gmusicapi-git'
	'python-urwid'
	'python-pyaml'
	'python-mpv'
	'python-scrypt'
	'python-pydbus'
	'pygobject-devel'
)
makedepends=('python-distribute')
source=($pkgname-$pkgver.zip::https://github.com/cfangmeier/tuijam/archive/$_pkgcommit.zip)
provides=('tuijam')
conflicts=('tuijam-git')
md5sums=('SKIP')

package() {
    cd "$srcdir/tuijam-${_pkgcommit}"
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$_/LICENSE"
}

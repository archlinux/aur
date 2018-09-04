# Maintainer: klardotsh <josh@klar.sh>

pkgname=tuijam
pkgver=0.2.11
pkgrel=1
_pkgcommit='db0b5140e147e5a0a92e6b0f1e973a40cd7795a5'
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

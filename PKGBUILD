# Maintainer: klardotsh <josh@klar.sh>

pkgname=tuijam
pkgver=0.3.4
pkgrel=1
_pkgcommit='46bea82a23f1628d2cba13a8c12df6484dcacf71'
pkgdesc=" A fancy TUI client for Google Play Music"
url="https://github.com/cfangmeier/tuijam"
arch=(any)
license=('MIT')
depends=(
	'python'
	'python-gmusicapi-git'
	'python-google-api-python-client'
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

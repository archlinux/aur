# Maintainer: Caleb Fangmeier <caleb@fangmeier.tech>
# Contributor: klardotsh <josh@klar.sh>

pkgname=tuijam
pkgver=0.5.0
pkgrel=1
_pkgcommit='80233e148080c5586e9f3d4496888f00728f79cc'
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
	'python-requests'
	'python-scrypt'
	'python-rsa'
	'python-pydbus'
	'pygobject-devel'
)
makedepends=('python-distribute')
source=($pkgname-$pkgver.tar.gz::https://github.com/cfangmeier/tuijam/archive/$_pkgcommit.tar.gz)
provides=('tuijam')
conflicts=('tuijam-git')
md5sums=('SKIP')

package() {
    cd "$srcdir/${pkgname}-${_pkgcommit}"
    python setup.py install --root="$pkgdir/" --optimize=1
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp LICENSE "$_/LICENSE"
}

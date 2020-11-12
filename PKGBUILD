# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Phil Schaf <flying-sheep@web.de>

_pypiname=pdfrw
pkgbase=python-pdfrw
pkgname=(python-pdfrw)
pkgver=0.4
pkgrel=6
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/pmaupin/$_pypiname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_pypiname-$pkgver.tar.gz::https://github.com/pmaupin/$_pypiname/archive/v$pkgver.tar.gz")
md5sums=('8dc599a0c808a15f1499c0116ee3c92d')

prepare(){
    cp -r "$srcdir/$_pypiname-$pkgver" "$srcdir/$_pypiname-$pkgver-py2"
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python3 setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

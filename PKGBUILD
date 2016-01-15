# Maintainer: Jiachen Yang <farseerfc@gmail.com>
# AUR Maintainer: Phil Schaf <flying-sheep@web.de>

_pypiname=pdfrw
pkgname=python-pdfrw
pkgver=0.2
pkgrel=2
pkgdesc='Convert restructured text to PDF via reportlab.'
arch=('any')
url="https://github.com/pmaupin/$_pypiname"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("$_pypiname-$pkgver.tar.gz::https://pypi.python.org/packages/source/p/pdfrw/pdfrw-0.2.tar.gz#md5=1b46eaca5b6e0516ec682459954b210d")
md5sums=('1b46eaca5b6e0516ec682459954b210d')

build() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --root="$pkgdir" -O1
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

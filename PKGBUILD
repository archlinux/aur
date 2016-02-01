# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-storjcore
_pkgname=${pkgname/python-/}
pkgver=0.0.6
pkgrel=2
pkgdesc="Storj core library"
url="https://github.com/Storj/storjcore"
depends=('python' 'python-setuptools' 'python-crypto' 'python-btctxstore')
optdepends=()
license=('MIT')
arch=('any')
source=("https://github.com/Storj/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('daf8f2e1ad9b0a5163c6c63506f85e118c70b1105a2720e081596cafd008d364de0c0d2a76908aede62a2deb23b6f15073f736c75c0f2e35f6ed38864775b766')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/
}


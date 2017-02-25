_pkgname=nuvolasdk
pkgname=python-${_pkgname}
pkgver=1.2.0
pkgrel=1
pkgdesc="SDK for building Nuvola Player's web app scripts"
url="https://github.com/tiliado/nuvolasdk"
depends=('python' 'python-pip'
)
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/13/16/bb7cec44ef49bcd103b82615f20c21bf8bdd3e3c35f8a2d20f30feb6bdad/${_pkgname}-${pkgver}.tar.gz")
md5sums=('a3292ebfdce912fac862aa669ad39a16')


build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

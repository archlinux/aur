_pkgname=nuvolasdk
pkgname=python-${_pkgname}
pkgver=4.7.0
pkgrel=1
pkgdesc="SDK for building Nuvola Player's web app scripts"
url="https://github.com/tiliado/nuvolasdk"
depends=(python python-pip)
optdepends=()
license=(BSD)
arch=(any)
source=(https://github.com/tiliado/nuvolasdk/archive/$pkgver.tar.gz)
md5sums=('8e9d2db8e60bc67cf60a52380a2588b7')


build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

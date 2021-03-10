# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-pypdf3
pkgver=1.0.3
pkgrel=1
pkgdesc="Pure-Python PDF library for splitting, merging, cropping, and transforming PDF pages."
arch=('any')
url="https://github.com/sfneal/PyPDF3"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/sfneal/PyPDF3/archive/${pkgver}.tar.gz")
sha256sums=('9ddd09afb7c1749609523b6c4fd705a503d40984b4c098938adaf20f975a9548')

build() {
    cd ${srcdir}/PyPDF3-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/PyPDF3-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

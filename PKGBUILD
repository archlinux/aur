# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-pypdf3
pkgver=1.0.5
pkgrel=1
pkgdesc="Pure-Python PDF library for splitting, merging, cropping, and transforming PDF pages."
arch=('any')
url="https://github.com/sfneal/PyPDF3"
license=('custom')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/sfneal/PyPDF3/archive/${pkgver}.tar.gz")
sha256sums=('8adc9a663e04561453645946d5e3429a4aece7132e2ab5c6babeb37c98e530c9')

build() {
    cd ${srcdir}/PyPDF3-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/PyPDF3-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

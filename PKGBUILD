# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-pypdf3
pkgver=1.0.6
pkgrel=2
pkgdesc="Pure-Python PDF library for splitting, merging, cropping, and transforming PDF pages."
arch=('any')
url="https://github.com/sfneal/PyPDF3"
license=('custom')
depends=('python')
depends=('python-tqdm')
makedepends=('python-setuptools')
source=("https://github.com/sfneal/PyPDF3/archive/${pkgver}.tar.gz")
sha256sums=('f8976fd9623052ac73f3f74f891a899880130dc98a4e465364b22f02ab835af0')

build() {
    cd ${srcdir}/PyPDF3-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/PyPDF3-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

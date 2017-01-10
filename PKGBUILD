# Maintainer: Carl George < arch at cgtx dot us >

pkgname="colout"
pkgver="0.5"
pkgrel="2"
pkgdesc="Color Up Arbitrary Command Output"
arch=("any")
url="https://nojhan.github.com/colout/"
license=("GPL3")
makedepends=("python-setuptools")
source=("https://github.com/nojhan/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('36a78b8773df212409d560a33607173adc5a457f8de64e453e6e8061af105c43')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends=("python-pygments" "python-babel")
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

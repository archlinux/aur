# Maintainer:  JakobDev<jakobdev at gmx dot de>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=python-jdtranslationhelper
pkgver=3.3
pkgrel=1
pkgdesc="A simple API for translating your programs"
arch=("any")
url="https://codeberg.org/JakobDev/jdTranslationHelper"
license=("BSD")
makedepends=("python-build" "python-installer" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/JakobDev/jdTranslationHelper/archive/${pkgver}.tar.gz")
sha256sums=("3e9da9743839b1223fa190c5449ce460b9cb97504610a36db0a93530dfae4b58")

build() {
    cd "jdtranslationhelper"
    python -m build --wheel --no-isolation
}

package() {
    cd "jdtranslationhelper"
    python -m installer --destdir "$pkgdir" dist/*.whl
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

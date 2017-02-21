# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="flake8-sql"
pkgver=0.2.0
pkgrel=1
pkgdesc="Plugin that checks SQL code against opinionated style rules."
arch=('any')
url="https://github.com/pgjones/${pkgname}"
license=('MIT')
depends=('flake8')
source=("https://github.com/pgjones/flake8-sql/archive/$pkgver.tar.gz")
md5sums=('1cde8e06c25aec0a415c32aafd8567f3')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

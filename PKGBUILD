# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="python-flake8-sql"
_pkgname=flake8-sql
pkgver=0.4.0
pkgrel=1
pkgdesc="Plugin that checks SQL code against opinionated style rules."
arch=('any')
url="https://github.com/pgjones/${_pkgname}"
license=('MIT')
depends=('flake8')
replaces=('flake8-sql')
provides=('flake8-sql')
source=("https://github.com/pgjones/flake8-sql/archive/$pkgver.tar.gz")
md5sums=('2068ed9edba616d42a9e67d0391e2d29')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgname=sqlite-utils
pkgver=3.12
pkgrel=1
pkgdesc="An open source multi-tool for exploring and publishing data"
arch=("any")
url="https://sqlite-utils.datasette.io/"
license=("Apache")
depends=("python-sqlite-fts4" "python-click" "python-click-default-group" "python-tabulate")
makedepends=("python-setuptools")
conflicts=("sqlite-utils")
source=("https://pypi.io/packages/source/s/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("78ee06317b9b83ae96538f778a1e89f31c95cced446b5c5648462e2214539efe")

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root=${pkgdir} --optimize=1
    install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

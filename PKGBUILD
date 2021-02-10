# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=python-pyqis
pkgname=${_pkgname}
pkgver=0.0.3
pkgrel=2
pkgdesc="Python QIS client for German university information servers"
arch=(any)
url="https://gitlab.com/Scrumplex/pyqis"
license=("GPL3")
depends=("python-requests" "python-beautifulsoup4" "python-lxml")
makedepends=("git" "python-setuptools" "python-wheel")
source=("${_pkgname}::git+https://gitlab.com/Scrumplex/pyqis.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "$_pkgname"

    python setup.py build
}

package() {
    cd "$_pkgname"

    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

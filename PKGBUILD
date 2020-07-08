# Maintainer: Valerii Huz <ghotrix@gmail.com>
pkgname=python2-pygal
pkgver=2.4.0
pkgrel=1
pkgdesc="pygal is a dynamic SVG charting library written in python"
arch=("any")
url="http://www.pygal.org/en/stable/"
license=("LGPL3")
depends=("python2")
makedepends=("python2-setuptools")
optdepend=("python2-lxml")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://github.com/Kozea/pygal/archive/$pkgver.tar.gz")
sha256sums=("16d29d72abc2e2bd5e296a68e62b5b98d797385295084eb7853fd4e221b471f7")

build() {
  cd "${srcdir}/pygal-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/pygal-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

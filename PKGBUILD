# Maintainer: Valerii Huz <ghotrix@gmail.com>
pkgname=python2-chess
pkgver=0.16.2
pkgrel=1
pkgdesc="Pure Python chess library"
arch=("any")
url="https://github.com/niklasf/python-chess/"
license=("MIT")
depends=("python2")
makedepends=("python2-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/ab/42/b4f04721c5c5bfc196ce156b3c768998ef8c0ae3654ed29ea5020c749a6b/PyAudio-$pkgver.tar.gz")
source=("https://github.com/niklasf/python-chess/archive/v$pkgver.tar.gz")
sha256sums=("08fc9993f5a781d77ac1c38eed520bef07314ae977427c46f515a416a63f7e64")

build() {
  cd "${srcdir}/python-chess-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/python-chess-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

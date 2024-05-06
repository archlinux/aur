# Maintainer: Bao Trinh <qubidt@gmail.com>

pkgname=python-nut2
pkgver=2.1.1
pkgrel=3
pkgdesc="Communicate with Network UPS Tools servers from Python"
arch=('any')
url="https://github.com/rshipp/python-nut2"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/n/nut2/nut2-${pkgver}.tar.gz")
sha256sums=('2166e827cec2a42cab89e9616407358698ad8b258a1f515fedc5a106ffc1f092')
validpgpkeys=('C1E446BFAC0D68828EDD98D19985DAD9D417608D')  # Ryan Shipp

build() {
  cd "nut2-${pkgver}"
  python setup.py build
}

package() {
  cd "nut2-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

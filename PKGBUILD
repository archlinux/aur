# Maintainer: Philip Sequeira <qmega+aur@sksm.net>

pkgname=python-anthemav
pkgver=1.4.2
pkgrel=1
pkgdesc='Python asyncio module to interface with Anthem AVM and MRX receivers'
url='https://github.com/nugget/python-anthemav'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nugget/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('57941e90273adfa93db2f1fa647bf6a376ca55af9b3050b15da7dcacb2455e3fe25a07e82120059e280707d295e880a3e7d3b7255a481ba9ef3599a8b51cde28')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst example.py
}

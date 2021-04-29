pkgname=python-minecraft-launcher-lib
pkgver=3.0
pkgrel=1
pkgdesc='A Python library for creating a custom minecraft launcher'
arch=('any')
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=('BSD')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=('362df7595389dcdb0d78a02f30b7ada41a07659f53c46aed7c8d6f3b9bd17cc8')

package() {
  cd "minecraft-launcher-lib-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

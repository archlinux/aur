pkgname=python-minecraft-launcher-lib
pkgver=2.1
pkgrel=1
pkgdesc='A Python library for creating a custom minecraft launcher'
arch=('any')
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=('BSD')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=('06739861cb77c9e8457d2a552c8881ed9e9cec7053e4a86ef4331edb182f8019')

package() {
  cd "minecraft-launcher-lib-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

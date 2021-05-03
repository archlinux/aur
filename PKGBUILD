pkgname=python-minecraft-launcher-lib
pkgver=3.1
pkgrel=1
pkgdesc='A Python library for creating a custom minecraft launcher'
arch=('any')
url="https://gitlab.com/JakobDev/minecraft-launcher-lib"
license=('BSD')
depends=('python-requests')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-lib/-/archive/${pkgver}/minecraft-launcher-lib-${pkgver}.tar.gz")
sha256sums=("8604b1256fda63e1da548e306e6cd8bc003f3c7e42ddcd4d12ec889f211280ef")

package() {
  cd "minecraft-launcher-lib-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

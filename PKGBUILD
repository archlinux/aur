pkgname=minecraft-launcher-cmd
pkgver=1.1
pkgrel=1
pkgdesc="Start Minecraft from commandline"
arch=("any")
url="https://gitlab.com/JakobDev/minecraft-launcher-cmd"
license=("BSD")
depends=("python-minecraft-launcher-lib")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-cmd/-/archive/${pkgver}/minecraft-launcher-cmd-${pkgver}.tar.gz")
sha256sums=("eee639fccf8add4a05c9f4619c3eef4ae0de492e5933d430900cc9250db42cdb")

package() {
  cd "minecraft-launcher-cmd-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

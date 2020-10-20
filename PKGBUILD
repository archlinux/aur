pkgname=minecraft-launcher-cmd
pkgver=1.0
pkgrel=1
pkgdesc='Start Minecraft from commandline'
arch=('any')
url="https://gitlab.com/JakobDev/minecraft-launcher-cmd"
license=('BSD')
depends=('python-minecraft-launcher-lib')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/JakobDev/minecraft-launcher-cmd/-/archive/${pkgver}/minecraft-launcher-cmd-${pkgver}.tar.gz")
sha256sums=('bc212daf66f1a0cd0cd44f5441252f1bd15e25a17fc4524f3590adc79c44ab07')

package() {
  cd "minecraft-launcher-cmd-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

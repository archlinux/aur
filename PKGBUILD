 # Maintainer: Mickael Bosch <mickael dot bosch at linux dot com>
pkgname='zegrapher'
pkgver=3.1.1
pkgrel=2
arch=('x86_64')
url="http://www.zegrapher.com"
makedepends=()
license=('GPL')
pkgdesc="mathematical objects plotting software"
depends=(qt5-base boost)
conflicts=(zegrapher)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AdelKS/ZeGrapher/archive/v${pkgver}.tar.gz")
sha256sums=('d140f2940b7fd47e65c780650d74970bc6304be1e735da5430504acccfa20078')

build() {
  cd "ZeGrapher-$pkgver"
  qmake
  make
}

package() {
  cd "ZeGrapher-$pkgver"
  install -Dm755 ZeGrapher "$pkgdir"/usr/bin/ZeGrapher
  install -Dm644 icons/ZeGrapher.png "$pkgdir"/usr/share/pixmaps/ZeGrapher.png
  install -Dm644 ZeGrapher.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

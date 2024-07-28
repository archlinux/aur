# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-ref_vk'
pkgver=1.0.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Vulkan renderer for yamagi-quake2'
url='https://github.com/yquake2/ref_vk/'
license=('GPL-2.0' 'custom')
depends=('yamagi-quake2')
makedepends=('vulkan-headers')
source=("${pkgname##*-}-${pkgver}.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('52d6c1336545671304e871c494c122381895dcf6658ed0cefc3fb94aaa2c4c37433a2e2a6c7d3b533864c8de37fe3aa11f482ee02d9fd548d4bd6b9611d13d65')

build() {
  make -C "${pkgname##*-}-${pkgver}"
}

package() {
  cd "${pkgname##*-}-${pkgver}"

  # library
  install -Dm644 'release/ref_vk.so' "${pkgdir}/usr/lib/yamagi-quake2/ref_vk.so"

  # doc
  install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # license
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

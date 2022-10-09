# Maintainer: Sainnhe Park <sainnhe@gmail.com>

pkgname=posy-improved-cursors
pkgver=1.6
pkgrel=1
pkgdesc="Posy's improved cursors by Michiel de Boer, available as cursor themes."
arch=(any)
url="https://github.com/simtrami/posy-improved-cursor-linux"
license=(unknown)
source=("https://github.com/simtrami/posy-improved-cursor-linux/archive/refs/tags/${pkgver}.tar.gz")
provides=('posy-cursors')
conflicts=('posy-cursors')
sha256sums=('4bc7c3bc7448035568364b68ce95ee612889d57542b649ef7131eba851d326ea')

package() {
  cd "${srcdir}/posy-improved-cursor-linux-${pkgver}"
  install -Ddm755 "${pkgdir}/usr/share/icons"
  for variant in Posy* ; do
    cp -dr --no-preserve=ownership "${variant}" "${pkgdir}/usr/share/icons/"
  done
}

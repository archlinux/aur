# Maintainer: mkoushan <mkoushan at proton dot me>
pkgname=parvaj-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Easy and fast (both in the sense of performance and development speed) VHDL simulation tool, integrating GHDL and GTKWave."
arch=('x86_64')
url="https://github.com/machitgarha/parvaj"
license=('AGPL3')
depends=('fuse2' 'gtkwave' 'ghdl-git')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  "${url}/releases/download/${pkgver}/parvaj-x86_64.AppImage"
  "LICENSE::${url}/raw/master/LICENSE.md"
)

package() {
  # install image file
  mkdir -p "${pkgdir}/usr/bin/" && chmod 755 "${pkgdir}/usr/bin/"
  install -Dm755 "parvaj-x86_64.AppImage" "${pkgdir}/usr/bin/parvaj"

  # install license file
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/parvaj/LICENSE"
}
sha256sums=('7806fc0cea5e8dafb2a86019daff22b5a402880d3b42dae8b4dddbfd66952954'
            '73ad60d6126608f92c89b0f973f2f925f5e6e5860b4b032bfeec78b1b1cc381d')

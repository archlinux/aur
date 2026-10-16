# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Co maintainer: a2n <a2n.dev at pm.me>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
_plasmoidName="a2n.blur"
pkgver=3.6.0
pkgrel=2
pkgdesc="KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/blurredwallpaper"
license=(GPL-2.0-or-later)
depends=(plasma-workspace)
conflicts=(kdeplasma-blurredwallpaper-git)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('175bfd291363b11c9b818d63f661540be5ea459e18f89a9a737ab8bdb63677887128972edfd1a35037f9c22b3f00148dd2118c6ad2757ef121851ccfb8440579')

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

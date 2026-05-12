# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Co maintainer: a2n <a2n.dev at pm.me>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
_plasmoidName="a2n.blur"
pkgver=3.5.2
pkgrel=1
pkgdesc="KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
conflicts=(kdeplasma-blurredwallpaper-git)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ae5ebc7de8fa54ec47fcc3a77e15a6b5b4636f2b37fc42d47491d3a80b6d8770d2e66c717aebd2a104609438c3dbf5069a1c35ace74fae95c3e30e4c3998989f')

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
  find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

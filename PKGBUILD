# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Co maintainer: a2n <a2n.dev at pm.me>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
_plasmoidName="a2n.blur"
pkgver=3.4.0
pkgrel=3
pkgdesc="KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
conflicts=(kdeplasma-blurredwallpaper-git)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('dfb2b867240df37e3308d1bd30bfb4edee8a421e994b35c95fa4aee5c2c649cce2bd7bd46654f1cb552f1e3e96a55fdbea06568953d97fa8ba24c81811598873')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

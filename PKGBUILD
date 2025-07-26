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
b2sums=('8394a2a8767b752a391d84a0b20238dbbbdb71287d9b8fe76ce8ea5ae1424ba69b1f50b895652db38a3cb76b00455e8140dfbc46e015b713e3ece7ce5a43ec65')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

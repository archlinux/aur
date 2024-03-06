# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
_plasmoidName="a2n.blur"
pkgver=3.0.1
pkgrel=1
pkgdesc="KDE Plasma wallpaper plugin that blurs the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
conflicts=(kdeplasma-blurredwallpaper-git)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('56e4162c01da62b7301f4eb58fd3bff4f2eabf351ed4ec016acf8d514da663fe')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

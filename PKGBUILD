# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>
# Co maintainer: a2n <a2n.dev at pm.me>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
_plasmoidName="a2n.blur"
pkgver=3.3.1
pkgrel=3
pkgdesc="KDE Plasma wallpaper plugin that blurs or/and dim the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
conflicts=(kdeplasma-blurredwallpaper-git)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4cb06e99f788e8455b8007a8a3ec2ed6095021a1624331fbd79e5042de57f645b626e7eab9e3ca4d1e3d53d67b520a6ff9d173989c36a90888da54ef926fb8bc')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    find "${_plasmoidName}" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/{}" \;
}

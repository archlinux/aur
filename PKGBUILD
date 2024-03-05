# Maintainer: dr460nf1r3 <root at dr460nf1r3 dot org>

pkgname=plasma6-wallpapers-blurredwallpaper
_pkgname=blurredwallpaper
_plasmoidName="a2n.blur"
pkgver=3.0.0
pkgrel=2
pkgdesc="KDE Plasma wallpaper plugin that blurs the wallpaper when a window is active"
arch=(x86_64)
url="https://github.com/bouteillerAlan/${_pkgname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c13a0b77ed65f76ea0dba4cadb593116e2a3be0ec95e8ef73cf7ba493f99c00b')

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/

    mkdir -p "${pkgdir}"/usr/share/plasma/wallpapers/"${_plasmoidName}"
    install -Dm 644 metadata.json -t "${pkgdir}"/usr/share/plasma/wallpapers/"${_plasmoidName}"/
    find "contents" -type f -exec install -Dm 644 "{}" "${pkgdir}/usr/share/plasma/wallpapers/${_plasmoidName}/{}" \;
}

# Maintainer: sife <wyattgoettsch@gmx.us>

pkgname=dmenu_bw
pkgver=0.0.2
pkgrel=3
pkgdesc="dmenu wrapper for bitwarden-cli written in POSIX shellscript."
arch=('x86_64')
url="https://github.com/Sife-ops/dmenu_bw"
license=('GPL3')
depends=('jq' 'yad' 'xclip')
optdepends=('libnotify' 'dmenu')
provides=('dmenu_bw')
conflicts=('dmenu_bw' 'dmenu_bw-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Sife-ops/dmenu_bw/archive/v${pkgver}.tar.gz")
sha256sums=('44645c7f75a23f30a2e8bd6b80e1d1d88fc595a0b764b03afaaaf959820a1f04')

package() {
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname}-${pkgver}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm755 "${pkgname}-${pkgver}/dmenu_bw" "${pkgdir}/usr/bin/dmenu_bw"
}

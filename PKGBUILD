# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=xsetwall-bin
_pkgname=xsetwall
pkgver=1.0.3
pkgrel=1
pkgdesc='A minimal utility for setting wallpapers in X11 environment'
url='https://github.com/0x61nas/xsetwall'
arch=(
    'x86_64'
)
license=('MIT')
depends=(
    'libx11'
)
options=(!debug)
provides=('xsetwall')
source=(
    "$_pkgname-$pkgver-bin::$url/releases/download/v${pkgver}/xsetwall-x86_64-linux-gnu"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/0x61nas/xsetwall/refs/tags/v${pkgver}/LICENSE"
    "readme-${pkgver}::https://raw.githubusercontent.com/0x61nas/xsetwall/refs/tags/v${pkgver}/readme"
    "xsetwall-${pkgver}.1::https://raw.githubusercontent.com/0x61nas/xsetwall/refs/tags/v${pkgver}/xsetwall.1"
)
sha256sums=(
    'f41d9a931da9283abbc4613a2dd0222f6040d69b6488caf69ecdbdc88982ff9d'
    'ddc49ced9f48c7402b323b4f379bf92973c44ae63f5ba047f828121efafcd319'
    '5974afb1900dcca039f09f8f62d4215988a2e960275f1f22aab34e6429a8ea83'
    '8564f58f54a4b5c2d7965aabb16b4b833837539fd4912acf4a16bc4739ccf132'
)

package() {
    install -Dm755 xsetwall-"${pkgver}"-bin "${pkgdir}/usr/bin/xsetwall"
    install -Dm644 xsetwall-"${pkgver}".1 "${pkgdir}/usr/share/man/man1/xsetwall.1"
    command -v gzip >/dev/null 2>&1 && gzip -9 "${pkgdir}/usr/share/man/man1/xsetwall.1"
    install -Dm644 LICENSE-"${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 readme-"${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/readme"
}

# vim: ts=4 sw=4 et:

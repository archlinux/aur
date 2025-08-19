# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>

pkgname=firefox-extension-ublacklist
pkgver=9.1.0
pkgrel=1
pkgdesc='Blocks specific sites from appearing in Google search results'
arch=(any)
url=https://github.com/iorate/ublacklist
license=(MIT)
depends=(
  firefox
)
source=(
  "${pkgname}-${pkgver}.xpi::${url}/releases/download/v${pkgver}/ublacklist-v${pkgver}-firefox.zip"
  "LICENSE::https://raw.githubusercontent.com/iorate/ublacklist/refs/tags/v${pkgver}/LICENSE.txt"
)
b2sums=('bd6a3674ec50568522d484cdb1876d574fdfea7683ddb4a7794e1a9d595a2b0c0d56f126b319980b4083e4757a6b167d20ee521fd7b4acbd8dfc993e508972f6'
        '31782ddd9bcdcc02df617037c675a215472fe17cf68b2d43649555fe669a24461691ae73a2d972a3a88849307fd1122ade1d5a04288edb12b31ce431c7d726ed')

package() {
  install -Dm644 ${pkgname}-${pkgver}.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/@ublacklist.xpi
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

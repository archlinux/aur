# Maintainer: oatmealraisin <archlinux at oatmealrais dot in>

pkgname=firefox-extension-ublacklist
pkgver=8.9.2
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
b2sums=(
  "eef7ab97235f2c207f1d928f25f60e50ffc0f947413abe8f6c95b1c1bcac9ea81f464f3d2eb88965880751ff19f75967e04254a22e1ead34769d860f2a2bc624"
  "31782ddd9bcdcc02df617037c675a215472fe17cf68b2d43649555fe669a24461691ae73a2d972a3a88849307fd1122ade1d5a04288edb12b31ce431c7d726ed"
)

package() {
  install -Dm644 ${pkgname}-${pkgver}.xpi \
    "$pkgdir"/usr/lib/firefox/browser/extensions/@ublacklist.xpi
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

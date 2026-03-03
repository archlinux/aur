# Maintainer: entemomoh2 <thiele61@gmx.de>

pkgname=cli-taskbar-calendar
pkgver=0.1.4
pkgrel=1
pkgdesc="Month/year popup calendar scripts for taskbar integrations"
arch=('any')
url="https://github.com/entemomoh2/cli-taskbar-calendar"
license=('MIT')
depends=('bash' 'util-linux' 'alacritty')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/entemomoh2/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9714fffa4059414a8d4b009c94c3957dd16f1e7cfbdba91afae59053f0f6f378')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 scripts/taskbar-month-calendar "${pkgdir}/usr/bin/taskbar-month-calendar"
  install -Dm755 scripts/taskbar-year-calendar "${pkgdir}/usr/bin/taskbar-year-calendar"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 examples/waybar-clock-snippet.jsonc "${pkgdir}/usr/share/doc/${pkgname}/examples/waybar-clock-snippet.jsonc"
  install -Dm644 examples/hyprland-rules.conf "${pkgdir}/usr/share/doc/${pkgname}/examples/hyprland-rules.conf"
  install -Dm644 examples/sway-criteria.conf "${pkgdir}/usr/share/doc/${pkgname}/examples/sway-criteria.conf"
  install -Dm644 examples/kwin-rule-notes.md "${pkgdir}/usr/share/doc/${pkgname}/examples/kwin-rule-notes.md"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

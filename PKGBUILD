# Maintainer: MCookinho <mcookinho@github>
# Contributor: MCookinho

pkgname=fnaf-cli-bin
pkgver=1.0
pkgrel=1
pkgdesc="Five Nights at Freddy's 1 terminal clone — survive the night in your terminal"
arch=('any')
url="https://github.com/MCookinho/fnaf-cli"
license=('MIT')
depends=('python')
provides=('fnaf-cli')
conflicts=('fnaf-cli')
source=("fnaf-cli-${pkgver}.tar.gz::https://github.com/MCookinho/fnaf-cli/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "${srcdir}/fnaf-cli-${pkgver}/fnaf1_terminal.py" "${pkgdir}/usr/bin/fnaf-cli"
  install -Dm644 "${srcdir}/fnaf-cli-${pkgver}/README.md" "${pkgdir}/usr/share/doc/fnaf-cli/README.md"

  # Desktop entry
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/fnaf-cli.desktop" <<EOF
[Desktop Entry]
Name=FNaF CLI
Comment=Five Nights at Freddy's Terminal Edition
Exec=fnaf-cli
Terminal=true
Type=Application
Categories=Game;
EOF
}

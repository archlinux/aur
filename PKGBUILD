# Maintainer: Aaron Bockelie <aaronsb@gmail.com>
#
# The fonts that the frits (font set files) vtium's console packages ship
# name, as dependencies on Arch's own font packages (ADR-1500 D8). The
# package installs no font and no frit, only its license: each console
# package installs its frits into /etc/vtium/fonts and lists vtium-fonts as
# an optional dependency, so the fonts stay optional. The glyph helper
# finds each font among the fonts installed on the machine, and leaves out
# a font the machine lacks.
#
#   - ttf-jetbrains-mono: JetBrains Mono, which the desktop frit draws text
#     with.
#   - ttf-nerd-fonts-symbols-mono: Symbols Nerd Font Mono, the symbols that
#     the desktop, minspec-16 and minspec-8 frits draw.
#   - noto-fonts-emoji: Noto Color Emoji, the emoji the same three frits
#     draw.
#   - terminus-font: the console font ter-v16n, which the terminus frit
#     draws.
#
# pkgver is the release whose frits these fonts serve, written as the vtium
# package writes it.

pkgname=vtium-fonts
pkgver=0.1.0alpha.5
pkgrel=1
pkgdesc='The fonts that the frits of the vtium console packages name'
arch=('any')
url='https://github.com/vtium/vtium-arch'
license=('MIT')
depends=('noto-fonts-emoji' 'terminus-font' 'ttf-jetbrains-mono'
         'ttf-nerd-fonts-symbols-mono')
source=('LICENSE')
sha256sums=('d539a3e857a06fe22834ab1308d115db5c5c0fc8080ccb46e763530bba825da7')

package() {
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

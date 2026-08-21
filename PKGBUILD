# Maintainer: Dominik Toth <info@dominiktoth.com>

pkgname=ku-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Fast, keyboard-driven Kubernetes TUI'
arch=('x86_64')
options=('!strip' '!debug')
url='https://github.com/bjarneo/ku'
license=('MIT')
provides=("ku=${pkgver}")
conflicts=('ku' 'ku-git')
optdepends=(
  'xdg-utils: open Kubernetes documentation from inside ku'
)
source=(
  "ku-${pkgver}-linux-amd64::https://github.com/bjarneo/ku/releases/download/v${pkgver}/ku-linux-amd64"
  "upstream-license::https://raw.githubusercontent.com/bjarneo/ku/v${pkgver}/LICENSE"
)
sha256sums=(
  '44f666c903036edd6d62fcd1b357e385b6e3efe4acaa735d4252de846c1b1aa3'
  'ebb1323d93aee5f8b4a672ec20ca24954373c85686be39307facb88dd582444c'
)

package() {
  install -Dm755 "ku-${pkgver}-linux-amd64" "$pkgdir/usr/bin/ku"
  install -Dm644 upstream-license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

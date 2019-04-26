# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=bitwarden-rofi
pkgver=0.4
pkgrel=1
pkgdesc="Wrapper for Bitwarden and Rofi"
arch=('any')
url="https://github.com/mattydebie/$pkgname"
license=('GPL3')
depends=('rofi' 'jq' 'bitwarden-cli')
optdepends=('xsel: copy to clipboard'
            'xclip: copy to clipboard'
            'wl-clipboard: copy to clipboard on wayland'
            'xdotool')
makedepends=()
source=("https://github.com/mattydebie/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('1cbcf6200ac0fec27038af0bf2ef864d3d20b96cb31a753cbde3df5e95d64ee807fc1db4e267ac797457289ec5fe5494ef8c468d4570e2046e4162b5910c0097')

package() {
  cd "$pkgname-$pkgver" || exit 1
  local doc_path="$pkgdir/usr/share/doc/${pkgname}"

  install -Dm755 "bwmenu" "$pkgdir/usr/bin/bwmenu"

  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}/img"

  install -Dm644 "README.md" "${doc_path}/README.md"
  install -Dm644 img/* "${doc_path}/img/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}


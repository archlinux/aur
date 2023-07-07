# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=bitwarden-rofi
pkgver=0.5
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
sha512sums=('a5ffd11f65e14fe7d506d3f72cb6b71471220b2cdd99023fb6ea624394a4b26fc344215b6b0999c2c3584fb413fb0f4372220e86f6748f97ca181995de948abb')

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


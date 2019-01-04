# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=bitwarden-rofi
pkgver=0.1
pkgrel=1
pkgdesc="Wrapper for Bitwarden bitwarden/cli and Rofi"
arch=('any')
url="https://github.com/mattydebie/$pkgname"
license=('GPL3')
depends=('rofi' 'jq' 'bitwarden-cli')
optdepends=('xsel: copy to clipboard',
            'xclip: copy to clipboard')
makedepends=()
source=("https://github.com/mattydebie/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('631add4ea96865a70da8984690a4f26afb7b3f199200dd129bcf0a9bbe0306c8e19af32df318ad0f16460818b24fa3119662baae44b9f45825186ef190a82060')

package() {
  cd "$pkgname-$pkgver"
  local doc_path="$pkgdir/usr/share/doc/${pkgname}"

  install -Dm755 "bwmenu" "$pkgdir/usr/bin/bwmenu"

  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"
  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}/img"

  install -Dm644 "README.md" "${doc_path}/README.md"
  install -Dm644 img/* "${doc_path}/img/"

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}


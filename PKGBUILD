# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=bitwarden-rofi
pkgver=0.3
pkgrel=1
pkgdesc="Wrapper for Bitwarden bitwarden/cli and Rofi"
arch=('any')
url="https://github.com/mattydebie/$pkgname"
license=('GPL3')
depends=('rofi' 'jq' 'bitwarden-cli')
optdepends=('xsel: copy to clipboard'
            'xclip: copy to clipboard')
makedepends=()
source=("https://github.com/mattydebie/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('f7d7825ec81a671113f35de47ed043b77eca496caa3480cebfdde02e40040e3973e04411bf9f0e922283354fba0e32ad0c83720c6ea12526ffb7629590f57fe8')

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


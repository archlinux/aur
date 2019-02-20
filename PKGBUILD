# Maintainer: Magnus Bergmark <magnus.bergmark@gmail.com>
pkgname=bitwarden-rofi
pkgver=0.2
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
sha512sums=('f39bacada75b1b093a4172c8caa479c8867890475f6ca2e0f91b67ff366e141672ef081a82082119affc4a91f4ee3004b044b53178b6a3d484f51fac60f1bdd4')

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


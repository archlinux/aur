# Maintainer: Omibranch <https://github.com/Omibranch>
pkgname=gitty-cli
pkgver=2.2.1
pkgrel=1
pkgdesc="Minimal Git CLI wrapper that speaks human"
arch=('x86_64' 'aarch64')
url="https://github.com/Omibranch/gitty"
license=('MIT')
depends=('git')
optdepends=(
  'xclip: clipboard support (X11)'
  'xsel: clipboard support (X11 fallback)'
  'wl-clipboard: clipboard support (Wayland)'
  'github-cli: full GitHub integration (push --share, rename repo, state URL)'
)
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/Omibranch/gitty/releases/download/v${pkgver}/gitty-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/Omibranch/gitty/releases/download/v${pkgver}/gitty-linux-arm64")
sha256sums_x86_64=('d9c76ea528e629f1205c2f5243da20b4fe8ad31b135d411a84b1b9be98a08aed')
sha256sums_aarch64=('08237d39dc89b7a426643fa68f1d87ad274aea7817d99ce0b12a7669ed88cb04')
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")

package() {
  cd "$srcdir"

  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/gitty"
  else
    install -Dm755 "${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/gitty"
  fi
}

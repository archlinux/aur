# Maintainer: Omibranch <https://github.com/Omibranch>
pkgname=gitty-cli
pkgver=2.1.0
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
sha256sums_x86_64=('834fcdfbed6dcf7c23a8576b5b6052e3594d5997716b6fc0cff60a1a4e182b2f')
sha256sums_aarch64=('364bebce9cad3108bc1344b4c28bce017534dfbfd1c2e1b38653cfd7c378dc76')
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")

package() {
  cd "$srcdir"

  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/gitty"
  else
    install -Dm755 "${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/gitty"
  fi
}

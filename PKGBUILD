# Maintainer: Omibranch <https://github.com/Omibranch>
pkgname=gitty-cli
pkgver=2.0.0
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
sha256sums_x86_64=('45373fd843088731db52479095f6220e7495cb59f251be8ba8a9b563f17f5eee')
sha256sums_aarch64=('41c1f546f4b084304b22af57700aebfd710921a0f77761c64f31f9f84bd0262a')
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")

package() {
  cd "$srcdir"

  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/gitty"
  else
    install -Dm755 "${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/gitty"
  fi
}

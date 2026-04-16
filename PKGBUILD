# Maintainer: Omibranch <https://github.com/Omibranch>
pkgname=gitty-cli
pkgver=2.2.0
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
sha256sums_x86_64=('78a276c8ca452ababa8f327cf974c2d88103db62b9bf584533bf75f9fe4c0a59')
sha256sums_aarch64=('3c94a594774e4e2097273d558f7c59c3485d601d0d2f55bc79304b353ed21a50')
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")

package() {
  cd "$srcdir"

  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/gitty"
  else
    install -Dm755 "${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/gitty"
  fi
}

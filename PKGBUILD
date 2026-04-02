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
sha256sums_x86_64=('7e61524fd06684363878646bb933bcaf932685317eac6aaf73b45be5e7fee5af')
sha256sums_aarch64=('776cf46199f457e160f4c1092b04f8259fee8bee9b6925b68747ab5bc0606aa6')
noextract=("${pkgname}-${pkgver}-x86_64" "${pkgname}-${pkgver}-aarch64")

package() {
  cd "$srcdir"

  if [ "$CARCH" = "x86_64" ]; then
    install -Dm755 "${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/gitty"
  else
    install -Dm755 "${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/gitty"
  fi
}

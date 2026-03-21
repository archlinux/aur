# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="Zoomer application for everyone on Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/coomer"
license=('MIT')

depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxrandr'
  'wayland'
  'libxkbcommon'
  'dbus'
)
optdepends=(
  'xdg-desktop-portal: portal screenshot backend'
)

provides=('coomer')
conflicts=('coomer')

source_x86_64=("coomer-v$pkgver-linux-x86_64.tar.gz::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-linux-x86_64.tar.gz")
sha256sums_x86_64=('24ea813d0dca3d474c5c6550a330d2d3b1c3c09e415bb42b6c7b086a7068e515')
source_aarch64=("coomer-v$pkgver-linux-arm64.tar.gz::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-linux-arm64.tar.gz")
sha256sums_aarch64=('df3199df0f4ddb7846e036f7685cce122435a7479042fbe610e2e551c33fe8aa')

package() {
  cd "$srcdir"

  install -Dm755 coomer \
    "$pkgdir/usr/bin/coomer"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 completions/fish/coomer.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/coomer.fish"

  install -Dm644 completions/bash/coomer \
    "$pkgdir/usr/share/bash-completion/completions/coomer"

  install -Dm644 completions/zsh/_coomer \
    "$pkgdir/usr/share/zsh/site-functions/_coomer"
}

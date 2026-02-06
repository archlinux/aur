# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="Zoomer application for everyone on Linux (prebuilt binary)"
arch=('x86_64')
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

source=("coomer-v$pkgver-linux-x86_64.tar.gz::https://github.com/yuzujr/coomer/releases/download/v$pkgver/coomer-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('ab9522eef12aba3b1f98ceccb58e8e6cd9ad74eb30bd258a489bca029463d30a')

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

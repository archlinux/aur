# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex-bin
_pkgname=pomtex
pkgver=0.4.0
pkgrel=1
pkgdesc="On-demand LaTeX: a portable TeX kernel that installs CTAN packages only when a document needs them (static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/pomtex"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
options=('!debug')
sha256sums_x86_64=('fb777aa820a6049d8e86e51fc7034d1c8cc4c992f8bda36eba4f3bc77144a962')
sha256sums_aarch64=('0fa85a2ad9effd995f3331aa74d47f300b6f6199c74f115bf1ac8e2feb34af35')

package() {
  cd "$_pkgname-$pkgver-linux-$CARCH"
  install -Dm755 pomtex "$pkgdir/usr/bin/pomtex"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 share/pomtex.bash "$pkgdir/usr/share/bash-completion/completions/pomtex"
  install -Dm644 share/pomtex.fish "$pkgdir/usr/share/fish/vendor_completions.d/pomtex.fish"
  install -Dm644 share/pomtex.zsh "$pkgdir/usr/share/zsh/site-functions/_pomtex"
  install -Dm644 share/pomtex.1 "$pkgdir/usr/share/man/man1/pomtex.1"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

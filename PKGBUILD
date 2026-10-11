# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex-bin
_pkgname=pomtex
pkgver=0.3.3
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
sha256sums_x86_64=('2d2eca46297e9b4755a4f40c00d81cb0b648113d087b3b64596f4ea0db1f4ed9')
sha256sums_aarch64=('299d28339f6072f1599350f982b01de887b26236667c720745b84fc05d7b80c1')

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

# Maintainer: Hüseyn Teymurzade <https://github.com/Huseynteymurzade28>

pkgname=pomtex-bin
_pkgname=pomtex
pkgver=0.3.2
pkgrel=1
pkgdesc="On-demand LaTeX: a portable TeX kernel that installs CTAN packages only when a document needs them (static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/Huseynteymurzade28/pomtex"
license=('MIT')
depends=('xz')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-aarch64.tar.gz")
options=('!debug')
sha256sums_x86_64=('f8ef7e8d73fea98e0a9008c14c9fe5548828164cb34520fff339d9ad1e50c1d4')
sha256sums_aarch64=('ab69ecb9f362d7d1af5539eb9429be6d795c923e18489ec9952e05b76267d14a')

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

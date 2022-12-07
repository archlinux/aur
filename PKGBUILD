# Maintainer: David Runge <dvzrv@archlinux.org>

_upstream=lsp_signature.nvim
_name=lsp_signature
pkgname=neovim-lsp_signature
pkgver=0.2.0
pkgrel=3
pkgdesc="LSP signature hint as you type"
arch=(any)
url="https://github.com/ray-x/lsp_signature.nvim/"
license=(Apache)
groups=(neovim-plugins)
depends=(luajit neovim)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha512sums=('c53a535136d28539e49e27da5fbfd3e78824c9b68184943d65e04b15308fab571340f9c1f388797821a9625496c2aea165f79d22c8799cf88160438e6a5b73e8')
b2sums=('e7b7044002e3413c4427fa8417ddab30ffb1a285530e126b8e5197024e486a3b55a35bedf05b9db8042acc9878c21e4348899e692d2685bf4818f69c671ea88c')

package() {
  cd $_upstream-$pkgver
  find doc lua -type f -exec install -vDm 644 {} "$pkgdir/usr/share/nvim/site/pack/dist/start/$_name/{}" \;
  install -vDm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

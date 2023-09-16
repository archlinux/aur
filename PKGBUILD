pkgname=neovim-formatter-git
pkgver=r149.44c89f0
pkgrel=1
pkgdesc="A format runner for Neovim"
arch=("any")
url="https://github.com/mhartington/formatter.nvim"
license=("MIT")

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)
source=(
  "git+https://github.com/mhartington/formatter.nvim.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd formatter.nvim
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd formatter.nvim
  find lua plugin doc -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/runtime/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

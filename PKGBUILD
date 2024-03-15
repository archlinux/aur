pkgname=neovim-cmp-tags-git
pkgver=r21.30bdc2e
pkgrel=2
pkgdesc="Tags completion source for nvim-cmp"
arch=("any")
url="https://github.com/quangnguyen30192/cmp-nvim-tags"
license=("Apache")

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/quangnguyen30192/cmp-nvim-tags.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd cmp-nvim-tags
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'neovim'
  )

  cd cmp-nvim-tags
  find after lua -type f -exec install -D -m644 '{}' "${pkgdir}/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

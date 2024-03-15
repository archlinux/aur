pkgname=neovim-cmp_luasnip-git
pkgver=r66.05a9ab2
pkgrel=1
pkgdesc="nvim-cmp source for LuaSnip"
arch=('any')
url="https://github.com/saadparwaiz1/cmp_luasnip"
license=('Apache')

groups=(
  'neovim-plugins'
)

makedepends=(
  'git'
)

source=(
  "git+https://github.com/saadparwaiz1/cmp_luasnip.git"
)

sha512sums=(
  'SKIP'
)

pkgver() {
  cd cmp_luasnip
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  depends+=(
    'neovim'
  )

  cd cmp_luasnip
  find after lua -type f -exec install -D -m644 '{}' "$pkgdir/usr/share/nvim/site/pack/dist/start/${pkgname}/{}" \;
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

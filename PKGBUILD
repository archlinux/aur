# Maintainer: you-oopsdev <itachi522ru@gmail.com>
_pkgname=vim-indent-rainbow
pkgname=vim-indent-rainbow-git
pkgver=r28.80164d5
pkgrel=1
pkgdesc="Coloring Tab for neovim/vim"
arch=(any)
url="https://github.com/adi/${_pkgname}"
license=('Apache 2.0')
optdepends=('vim: vim support'
            'neovim: neovim support')
makedepends=('git')
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}/autoload/"
  #Vim
  install -dm 755 "${pkgdir}/usr/share/vim/vimfiles/autoload/"
  install -Dm 644 "rainbow.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/"
  install -Dm 644 "togglerb.vim" "${pkgdir}/usr/share/vim/vimfiles/autoload/"
  #Neovim
  install -dm 755 "${pkgdir}/usr/share/nvim/runtime/autoload/"
  install -Dm 644 "rainbow.vim" "${pkgdir}/usr/share/nvim/runtime/autoload/"
  install -Dm 644 "togglerb.vim" "${pkgdir}/usr/share/nvim/runtime/autoload/"

  install -Dm 644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim: ts=2 sw=2 et:

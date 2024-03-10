# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: lukebond

pkgname=neovim-ctrlp
pkgver=1.81
pkgrel=1
pkgdesc="Full path fuzzy file, buffer, mru, tag, ... finder"
arch=('any')
url="http://ctrlpvim.github.com/ctrlp.vim/"
license=('custom:vim')
depends=('neovim')
optdepends=('ctags: for searching tags')
groups=('neovim-plugins')
install=nvim-doc.install
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ctrlpvim/ctrlp.vim/archive/$pkgver.tar.gz"
  LICENSE)
sha256sums=('9de452e7c3c2e1831007fdc69149368f9169837681ff46a09e1bca8cbdbebf93'
            '446c67d93c43addf076fe103a71844c2d875d478f82186436567dd221f2652f3')

package() {
  cd "${srcdir}/ctrlp.vim-${pkgver}"

  installpath="${pkgdir}/usr/share/nvim/runtime"

  install -d "$installpath/autoload/ctrlp/"
  install -Dm644 autoload/ctrlp/* "$installpath/autoload/ctrlp/"
  install -Dm644 autoload/ctrlp.vim "$installpath/autoload/ctrlp.vim"
  install -Dm644 doc/ctrlp.txt "$installpath/doc/ctrlp.txt"
  install -Dm644 plugin/ctrlp.vim "$installpath/plugin/ctrlp.vim"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

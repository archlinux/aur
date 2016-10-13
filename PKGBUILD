pkgname=neovim-ctrlp
pkgver=1.79
_gitcommit=c1646e3
pkgrel=1
pkgdesc="Full path fuzzy file, buffer, mru, tag, ... finder"
arch=('any')
url="http://kien.github.com/ctrlp.vim/"
license=('custom:vim')
depends=('neovim')
optdepends=('ctags: for searching tags')
groups=('neovim-plugins')
install=nvim-doc.install
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/kien/ctrlp.vim/tarball/$_gitcommit"
  LICENSE)
sha1sums=('9d9f7631a1ac579eb0c895a8707fb0e7111736bb'
          'be741035a33a75861fa14fcbd634d4174912c540')

package() {
  cd "${srcdir}/kien-ctrlp.vim-${_gitcommit}"

  installpath="${pkgdir}/usr/share/nvim/runtime"

  install -d "$installpath/autoload/ctrlp/"
  install -Dm644 autoload/ctrlp/* "$installpath/autoload/ctrlp/"
  install -Dm644 autoload/ctrlp.vim "$installpath/autoload/ctrlp.vim"
  install -Dm644 doc/ctrlp.txt "$installpath/doc/ctrlp.txt"
  install -Dm644 plugin/ctrlp.vim "$installpath/plugin/ctrlp.vim"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

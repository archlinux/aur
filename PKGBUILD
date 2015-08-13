# Maintainer: Patrice Peterson <runiq at archlinux dot us>
pkgname=vim-tagbar
_pkgname=tagbar
pkgver=2.6.1
pkgrel=2
pkgdesc="Vim plugin that displays tags in a window, ordered by class etc."
arch=('any')
url="http://majutsushi.github.com/tagbar/"
license=('custom:vim')
depends=('ctags>=5.5' 'vim>=7.0')
makedepends=('unzip')
install=vimdoc.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/majutsushi/$_pkgname/tarball/v$pkgver"
        "LICENSE")
md5sums=('74043a78d072fa70eb449e206602d3dd'
         'cd49910a3dde6fe0a7e24ebe8cbf7066')

package() {
  cd majutsushi-tagbar-e872e67

  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 doc/tagbar.txt ${_installpath}/doc/tagbar.txt
  install -Dm644 autoload/tagbar.vim ${_installpath}/autoload/tagbar.vim
  install -Dm644 plugin/tagbar.vim ${_installpath}/plugin/tagbar.vim
  install -Dm644 syntax/tagbar.vim ${_installpath}/syntax/tagbar.vim
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}
# vim:set ts=2 sw=2 et:

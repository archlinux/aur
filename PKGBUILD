# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=vim-tagbar
pkgver=2.6.1
pkgrel=3
pkgdesc='Vim plugin to browse the tags of the current file and get an overview of its structure'
arch=('any')
url='https://majutsushi.github.io/tagbar/'
license=('custom:vim')
depends=('ctags>=5.5' 'vim>=7.0')
makedepends=('unzip')
install=vimdoc.install
source=("https://github.com/majutsushi/${pkgname#vim-}/archive/v${pkgver}.tar.gz"
        'LICENSE')
sha256sums=('c061a7e0a45a166f4558b31e6c47b9fd701f5fa1319527b65a268ea054dea5fb'
            'c05eac35d5c38c79d85a85bf437e13b59c1f1abdfab3a2701dcd48fc61b9677f')

package() {
  cd ${pkgname#vim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 doc/tagbar.txt ${_installpath}/doc/tagbar.txt
  install -Dm644 autoload/tagbar.vim ${_installpath}/autoload/tagbar.vim
  install -Dm644 plugin/tagbar.vim ${_installpath}/plugin/tagbar.vim
  install -Dm644 syntax/tagbar.vim ${_installpath}/syntax/tagbar.vim
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/license.txt
}

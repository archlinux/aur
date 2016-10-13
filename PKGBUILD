# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

pkgname=neovim-tagbar
pkgver=2.6.1
pkgrel=1
pkgdesc='Neovim plugin to browse the tags of the current file and get an overview of its structure'
url='https://majutsushi.github.io/tagbar/'
arch=('any')
license=('custom:vim')
depends=('ctags' 'neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/majutsushi/tagbar/archive/v${pkgver}.tar.gz
        LICENSE)
sha512sums=('eb0f29dc2f08d943e1ac0c0fe97ed72a49b85e22d105815a5557e205532be379d3ce8429c5303b917c005b465a7385161ff2edc96efc0fc312178155c67a7c22'
            '01f828e4cf4dee832d2b2976d19163f9e9968089c49a0a33783bd84f3507daf1da0730b12d4dae5bc1edbbf2e419f1ba46adb2347155753c06c94dc30631bf29')

package() {
  cd ${pkgname#neovim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  install -Dm 644 doc/tagbar.txt "${_installpath}/doc/tagbar.txt"
  install -Dm 644 autoload/tagbar.vim "${_installpath}/autoload/tagbar.vim"
  install -Dm 644 plugin/tagbar.vim "${_installpath}/plugin/tagbar.vim"
  install -Dm 644 syntax/tagbar.vim "${_installpath}/syntax/tagbar.vim"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

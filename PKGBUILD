# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=neovim-nerdcommenter
pkgver=2.5.2
pkgrel=1
pkgdesc='A Neovim plugin that allows for easy commenting of code for many filetypes'
url='https://github.com/scrooloose/nerdcommenter'
arch=('any')
license=('custom')
depends=('neovim')
groups=('neovim-plugins')
install=nvim-doc.install
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/scrooloose/nerdcommenter/archive/${pkgver}.tar.gz
        LICENSE)
sha512sums=('63b43abdae35e2e5d9132a5cc1e3109a9ac7945bab58b7f2544bb0a6d390f2f503928fd17c2e82104e84454d9278f98fc581dcea8ccd08f5f1bedb2d5f112bf4'
            'fb6575315a22516e29ad414c8e0c9074e0e18a5361ce746524d938e0bf329f7b742b66dc43cfba138f69534d747507e2983b34149d7c66bd4ae2e1b435e37034')

package() {
  cd ${pkgname#neovim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  install -Dm 644 doc/NERD_commenter.txt "${_installpath}/doc/NERD_commenter.txt"
  install -Dm 644 plugin/NERD_commenter.vim "${_installpath}/plugin/NERD_commenter.vim"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

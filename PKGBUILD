# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=neovim-nerdcommenter
pkgver=2.4.0
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
sha512sums=('ec389cd3f6f1f2093debe2e2d5a09573324d9f8459b4f6c3528bf7b46f9b84fad08718e140be6d39bb8c990778de89fda7f9bb06704c1ea6ff319e6ac431fcdd'
            '1b4064171fa88f41d05e3d1d1c14ceb8a5cb4cca9e6f08f7e267d7740b7d65e4765cb56f0ccf3765ee9c85654559d2d7726d71516b890b0174b68e6cc62ef421')

package() {
  cd ${pkgname#neovim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  install -Dm 644 doc/NERD_commenter.txt "${_installpath}/doc/NERD_commenter.txt"
  install -Dm 644 plugin/NERD_commenter.vim "${_installpath}/plugin/NERD_commenter.vim"
  install -Dm 644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

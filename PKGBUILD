# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: oozyslug <oozyslug at gmail dot com>

pkgname=neovim-plug
pkgver=0.14.0
pkgrel=1
pkgdesc="A Neovim plugin manager"
arch=('any')
url="http://github.com/junegunn/${pkgname#neo}"
license=('MIT')
depends=('vim-plugin-runtime')
groups=('neovim-plugins')
source=("${url}/archive/$pkgver.tar.gz"
        "$pkgname.init.vim")

sha512sums=('256592e5fa0154e1ff5c689569c3cdd7004edfd76aae189612e26ead692627d82d7c3f826388bcf2011503c3cd9bc1a7d1c38e7f44b98dabe24cac637ca00f81'
            'fb943ed92e20277bed6ff29da973cd96ba05c89dbde438d1bf7821cd810151a08101a67338381fac5ce0df8716c71313f30aa8202b1a75054a9d343f873a9414')
install=neovim-plug.install

package() {
  install -Dm 644 ${pkgname#neo}-${pkgver}/plug.vim ${pkgdir}/usr/share/nvim/runtime/autoload/plug.vim
  install -Dm 644 "$pkgname.init.vim" ${pkgdir}/usr/share/doc/neovim-plug/init.vim.sample
  # no LICENSE file offered.
}
# vim: set ts=2 sw=2 et:

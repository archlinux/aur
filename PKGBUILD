# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: oozyslug <oozyslug at gmail dot com>

pkgname=neovim-plug
pkgver=0.13.0
pkgrel=1
pkgdesc="A Neovim plugin manager"
arch=('any')
url="http://github.com/junegunn/${pkgname#neo}"
license=('MIT')
depends=('vim-plugin-runtime')
groups=('neovim-plugins')
source=("${url}/archive/$pkgver.tar.gz"
        "$pkgname.init.vim")

sha512sums=('cfe78c7d5bd424f3d36d6f482199b48dbbd0dce1f3cb414f5880b1c8be26f2f657554ebb2f1a709a8f2dd8a6d28f0875aecf3f94c5c198164c8bd3c3e57e4d01'
            'fb943ed92e20277bed6ff29da973cd96ba05c89dbde438d1bf7821cd810151a08101a67338381fac5ce0df8716c71313f30aa8202b1a75054a9d343f873a9414')
install=neovim-plug.install

package() {
  install -Dm 644 ${pkgname#neo}-${pkgver}/plug.vim ${pkgdir}/usr/share/nvim/runtime/autoload/plug.vim
  install -Dm 644 "$pkgname.init.vim" ${pkgdir}/usr/share/doc/neovim-plug/init.vim.sample
  # no LICENSE file offered.
}
# vim: set ts=2 sw=2 et:

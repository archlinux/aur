# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: oozyslug <oozyslug at gmail dot com>

pkgname=neovim-plug
pkgver=0.9.1
pkgrel=3
pkgdesc="A Neovim plugin manager"
arch=('any')
url="http://github.com/junegunn/${pkgname#neo}"
license=('MIT')
depends=('neovim')
groups=('neovim-plugins')
source=("${url}/archive/$pkgver.tar.gz"
        "$pkgname.init.vim")

sha512sums=('87a205ff5c102489041c07df3922634b8552fdaa58155481216c0fe8f9d177ac4ad03ce2936bfd9d6e81695ec2978b1d51e84d72c9b636423791ca9e80c417cc'
            'fb943ed92e20277bed6ff29da973cd96ba05c89dbde438d1bf7821cd810151a08101a67338381fac5ce0df8716c71313f30aa8202b1a75054a9d343f873a9414')
install=neovim-plug.install

package() {
  install -Dm 644 ${pkgname#neo}-${pkgver}/plug.vim ${pkgdir}/usr/share/nvim/runtime/autoload/plug.vim
  install -Dm 644 "$pkgname.init.vim" ${pkgdir}/usr/share/doc/neovim-plug/init.vim.sample
  # no LICENSE file offered.
}
# vim: set ts=2 sw=2 et:

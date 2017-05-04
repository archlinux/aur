# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: oozyslug <oozyslug at gmail dot com>

pkgname=neovim-plug
pkgver=0.9.1
pkgrel=2
pkgdesc="A Neovim plugin manager"
arch=('any')
url="http://github.com/junegunn/${pkgname#neo}"
license=('MIT')
depends=('neovim')
groups=('neovim-plugins')
source=("${url}/archive/$pkgver.tar.gz"
        "$pkgname.init.vim")

sha512sums=('87a205ff5c102489041c07df3922634b8552fdaa58155481216c0fe8f9d177ac4ad03ce2936bfd9d6e81695ec2978b1d51e84d72c9b636423791ca9e80c417cc'
            '8e15c2074d0ce36daa0568167bcbcaf1038b8f65edcab661c9d41a9a18714b27accab28f5065408852329827ff4c84c03102c17bd542962cde1f057e88c4044c')
install=neovim-plug.install

package() {
  install -Dm 644 ${pkgname#neo}-${pkgver}/plug.vim ${pkgdir}/usr/share/nvim/runtime/autoload/plug.vim
  install -Dm 644 "$pkgname.init.vim" ${pkgdir}/usr/share/doc/neovim-plug/init.vim.sample
  # no LICENSE file offered.
}
# vim: set ts=2 sw=2 et:

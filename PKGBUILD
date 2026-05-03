# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vim-surround
pkgver=2.2
pkgrel=4
pkgdesc='Provides mappings to easily delete, change, and add paired surroundings'
url='https://github.com/tpope/vim-surround'
arch=('any')
license=(Vim)
makedepends=(vim)
depends=('vim-plugin-runtime')
groups=('vim-plugins')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/tpope/vim-surround/archive/v${pkgver}.tar.gz
        LICENCE)
sha512sums=('ef0bac868ca30cc5606f12898f131debaff3b42ad178ab83b363e46210edb8e084658505f28ba46e24012dfc1843e22603bb2c4f40b5010db13aacf07b0bd970'
            'd16902e9e25d60dd60404b08e8c6d035e230e695e47c2af6ff319cbc1e035fa5aad2c334d68e2ff01038ed32c5e59470f678aa938fb4b644b7e673587a2c7db7')

package() {
  cd ${pkgname}-${pkgver}
  local installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm 644 doc/* -t "${installpath}/doc"
  install -Dm 644 plugin/* -t "${installpath}/plugin"
  install -Dm 644 ../LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.markdown -t "${pkgdir}/usr/share/doc/${pkgname}"
}

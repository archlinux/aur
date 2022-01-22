# Maintainer:  Joost Bremmer <toost.b@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: eolianoe <eolianoe At GoogleMAIL DoT com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Laszlo Papp <djszapi @ gmail at com>

pkgname=neovim-nerdcommenter
pkgver=2.6.0
pkgrel=2
pkgdesc='A Neovim plugin that allows for easy commenting of code for many filetypes'
url='https://github.com/scrooloose/nerdcommenter'
arch=('any')
license=('custom')
depends=('neovim')
groups=('neovim-plugins')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/scrooloose/nerdcommenter/archive/${pkgver}.tar.gz)
sha512sums=('e5b576812351955641011ceb1c8af0e85a2f4be3db8b8bd3e8da05aff6d3beba8e0dfcbd3c78cf6833a0f4aaf07fd87cb05151fdd5f341037b4393590134023b')

package() {
  cd ${pkgname#neovim-}-${pkgver}
  _installpath="${pkgdir}/usr/share/nvim/runtime"
  install -Dm 644 autoload/nerdcommenter.vim "${_installpath}/autoload/nerdcommenter.vim"
  install -Dm 644 doc/nerdcommenter.txt "${_installpath}/doc/nerdcommenter.txt"
  install -Dm 644 plugin/nerdcommenter.vim "${_installpath}/plugin/nerdcommenter.vim"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:

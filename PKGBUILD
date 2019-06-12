# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=vim-lawrencium
_hgnode=06f4d2c01fd6
_hglatesttag=0.3.1
_hglatesttagdistance=62
pkgver="${_hglatesttag}+${_hglatesttagdistance}+${_hgnode}"
pkgrel=1
pkgdesc='Mercurial Wrapper For Vim'
url='https://bolt80.com/lawrencium/'
arch=('any')
license=('MIT')
depends=('vim' 'mercurial')
groups=('vim-plugins')
source=("${pkgname}-${_hgnode}.zip::https://bitbucket.org/ludovicchabant/vim-lawrencium/get/${_hgnode}.zip")
sha512sums=('afc6b81f071b242282ef6c573f63c3851e5b5de1765eb83234abc2bff7bf1b6dddb8bb18798b49183b270a89bb812c78129f07c019d596ea17c837b6150327e0')

package () {
  cd "${srcdir}/ludovicchabant-vim-lawrencium-${_hgnode}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp --recursive --target-directory="${_installpath}" doc ftplugin resources autoload ftdetect plugin syntax
  install -Dm 644 --target-directory="${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: ts=2 sw=2 et:

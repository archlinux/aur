# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=vim-lawrencium
_hgnode=4592f24a50386e02870fa8d508cc7ba8454dc102
_hglatesttag=0.3.1
_hglatesttagdistance=71
pkgver="${_hglatesttag}+${_hglatesttagdistance}+${_hgnode:0:12}"
pkgrel=1
pkgdesc='Mercurial Wrapper For Vim'
url='https://bolt80.com/lawrencium/'
arch=('any')
license=('MIT')
depends=('vim' 'mercurial')
groups=('vim-plugins')
source=("${pkgname}-${_hgnode}.zip::https://github.com/ludovicchabant/vim-lawrencium/archive/${_hgnode}.zip")
sha512sums=('964b68cd4be8881e4f97d43a35209e7b0b715f557a557d9db7bdf042ba068191518daf4230f0d6244cef4e924fb058fa4991aa196278f6289fab269f6332dcd9')

package () {
  cd "${srcdir}/vim-lawrencium-${_hgnode}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp --recursive --target-directory="${_installpath}" doc ftplugin resources autoload ftdetect plugin syntax
  install -Dm 644 --target-directory="${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: ts=2 sw=2 et:

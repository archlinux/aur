# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>

pkgname=vim-lawrencium
_hgnode=78176bdfe0be
_hglatesttag=0.3.1
_hglatesttagdistance=60
pkgver="${_hglatesttag}+${_hglatesttagdistance}+${_hgnode}"
pkgrel=1
pkgdesc='Mercurial Wrapper For Vim'
url='https://bolt80.com/lawrencium/'
arch=('any')
license=('MIT')
depends=('vim' 'mercurial')
groups=('vim-plugins')
source=("${pkgname}-${_hgnode}.zip::https://bitbucket.org/ludovicchabant/vim-lawrencium/get/${_hgnode}.zip")
sha512sums=('ec67ea943d10a48bde10b829e0bf47bfae3e7c85f24dff2529f61eec708acefc849ddc0fb7c03c4dd18d6f9f98dbf41b77f5e0db57b145ef96fc41500c0beac6')

package () {
  cd "${srcdir}/ludovicchabant-vim-lawrencium-${_hgnode}"
  local _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp --recursive --target-directory="${_installpath}" doc ftplugin resources autoload ftdetect plugin syntax
  install -Dm 644 --target-directory="${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim: ts=2 sw=2 et:

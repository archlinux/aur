# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=vim-gitgutter
_gitcommit=c27bfab8c51e77419ee0c4a9c4e3ba359dbc2ad4
pkgver=708.c27bfab
pkgrel=1
pkgdesc='Vim plugin which shows a git diff in the gutter (sign column)'
url='https://github.com/airblade/vim-gitgutter'
arch=('any')
license=('MIT')
depends=('vim' 'git')
groups=('vim-plugins')
source=(${pkgname}::"git+https://github.com/airblade/vim-gitgutter#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r -t "${_installpath}" autoload doc plugin
  install -Dm 644 README.mkd -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENCE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:

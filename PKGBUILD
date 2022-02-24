# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=vim-airline-themes
pkgver=r1435.97cf3e6
_gitcommit=97cf3e6e638f936187d5f6e9b5eb1bdf0a4df256
pkgrel=1
pkgdesc='Themes for vim-airline'
url='https://github.com/vim-airline/vim-airline-themes'
arch=('any')
license=('MIT')
depends=('vim')
makedepends=('git')
groups=('vim-plugins')
source=("git+${url}#commit=${_gitcommit}")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

package() {
  cd ${pkgname}
  _installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -d "${_installpath}"
  cp -r autoload doc plugin "${_installpath}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=vim-gitgutter
_gitcommit=91471746fe687ee867877508dfd809460dab5698
pkgver=564.9147174
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

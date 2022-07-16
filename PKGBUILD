# Maintainer: Martin Minka <martin.minka@gmail.com>
# Submitter: Oliver Kraitschy <okraits at arcor dot de>
# Contributor: David Thurstenson <thurstylark@gmail.com>

pkgname=j4-make-config-git
pkgver=r69.feee58f
pkgrel=1
pkgdesc='Universal theme switcher and config generator for the i3 wm'
arch=('any')
url='https://github.com/okraits/j4-make-config'
license=('GPL')
depends=('python')
makedepends=('git')
optdepends=('rofi: interactive theme menu'
            'xorg-xsetroot: set root window background')
source=('git+https://github.com/okraits/j4-make-config.git')
sha1sums=('SKIP')

_gitname='j4-make-config'

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"

  install -Dm755 j4-make-config  "${pkgdir}/usr/bin/j4-make-config"
  install -Dm644 README.md  "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -d "${pkgdir}/usr/share/${pkgname}/themes"
  install -Dm644 themes/*  "${pkgdir}/usr/share/${pkgname}/themes/"

}

# vim:set ts=2 sw=2 et:

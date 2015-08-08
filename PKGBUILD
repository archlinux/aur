# Contributor: naxuroqa <naxuroqa@gmail.com>

pkgname=numix-shine-icon-theme-git
_gitname=numix-icon-theme-shine
pkgver=5.428f9a8
pkgrel=2
pkgdesc="An icon theme from the Numix project with a glossy design"
arch=('any')
url="https://github.com/numixproject/numix-icon-theme-shine"
license=('GPL3')
depends=('numix-icon-theme-git')
makedepends=('git')
optdepends=()
provides=('numix-shine-icon-theme')
conflicts=('numix-shine-icon-theme')
install="numix-shine-icon-theme.install"
source=('git://github.com/numixproject/numix-icon-theme-shine.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd $_gitname

  install -d -m 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve=ownership Numix-Shine "$pkgdir"/usr/share/icons/
}

# vim: ts=2 sw=2 et:

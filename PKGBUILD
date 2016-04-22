# Maintainer: nexttrex <jan@nexttrex.de>

pkgname='cinnamon-theme-numix-git'
pkgver=r88.0227932
pkgrel=1
pkgdesc="A cinnamon theme"
arch=('any')
url='https://github.com/zagortenay333/numix-cinnamon'
license=('AGPL3')
source=("$pkgname::git+https://github.com/zagortenay333/numix-cinnamon.git")
md5sums=('SKIP')
depends=('cinnamon')
makedepends=('git')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd $pkgname
  install -dm755 $pkgdir/usr/share/themes
  cp -R Numix-Cinnamon $pkgdir/usr/share/themes/
}

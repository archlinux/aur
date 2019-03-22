pkgname='cinnamon-theme-new-minty-git'
pkgver=r127.c2b00d5
pkgrel=2
pkgdesc="New-Minty Cinnamon theme"
arch=('any')
url='https://github.com/zagortenay333/new-minty'
license=('AGPL3')
source=("$pkgname::git+https://github.com/zagortenay333/new-minty.git")
md5sums=('SKIP')
depends=('cinnamon' 'ttf-roboto' 'noto-fonts' 'noto-fonts-extra')
makedepends=('git')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd $pkgname
  install -dm755 $pkgdir/usr/share/themes
  cp -R New-Minty $pkgdir/usr/share/themes/
}

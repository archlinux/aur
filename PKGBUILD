# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=colloid-icon-theme-git
pkgver=2022.02.08.r2.gaec97d9
pkgrel=1
pkgdesc="Modern and clean icon theme for linux"
arch=('any')
url="https://www.pling.com/p/1661983"
license=('GPL3')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/vinceliuice/Colloid-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Colloid-icon-theme"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/Colloid-icon-theme"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -t all -d "$pkgdir/usr/share/icons"
}

# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=tela-circle-icon-theme-git
pkgver=2020.11.29.r102.gaa1f1446
pkgrel=1
pkgdesc="A flat colorful design icon theme"
arch=('any')
url="https://www.pling.com/p/1359276"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/vinceliuice/Tela-circle-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -dm755 "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}

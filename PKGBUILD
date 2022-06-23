# Maintainer: RubixDev <silas dot groh at t-online dot de>
_color=green
pkgname=tela-icon-theme-$_color-git
pkgver=2022.02.21.r14.g47b82d4c
pkgrel=2
pkgdesc="A flat colorful design icon theme (only $_color variant)"
arch=('any')
url="https://github.com/vinceliuice/Tela-icon-theme"
license=('GPL3')
depends=()
makedepends=('git' 'gtk-update-icon-cache')
conflicts=("tela-icon-theme")
options=('!strip')
source=("${pkgname%-$_color-git}::git+https://github.com/vinceliuice/Tela-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-$_color-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-$_color-git}"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -d "$pkgdir/usr/share/icons" $_color
}


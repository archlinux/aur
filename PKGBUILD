# Maintainer: Curve <curve.platin at gmail.com>
pkgname=tela-icon-theme-kde-accent-git
_gitname=tela-icon-theme
pkgver=2022.02.21.r3.gc440cc0d
pkgrel=2
pkgdesc="A flat colorful design icon theme."
arch=('any')
url="https://www.pling.com/p/1279924"
license=('GPL3')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${_gitname%-git}")
conflicts=("${_gitname%-git}")
options=('!strip')
source=("${_gitname%-git}::git+https://github.com/vinceliuice/Tela-icon-theme.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_gitname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${_gitname%-git}"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -d "$pkgdir/usr/share/icons" -c
}

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=tela-circle-icon-theme-git
pkgver=2023.10.07.r0.gbdbebcdb
pkgrel=1
pkgdesc="A flat colorful design icon theme"
arch=('any')
url="https://github.com/vinceliuice/Tela-circle-icon-theme"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=('git+https://github.com/vinceliuice/Tela-circle-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Tela-circle-icon-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd Tela-circle-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -a -d "$pkgdir/usr/share/icons"
}

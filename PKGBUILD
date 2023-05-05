# Maintainer: Arthur Vuillard <arthur@hashbang.fr>
_pkgname=hamster-shell-extension
pkgname=gnome-shell-extension-hamster-git
pkgver=gnome.shell.3.38.r32.g75541ac
pkgrel=1
pkgdesc="GNOME Shell extension for Hamster Time Tracker."
arch=('any')
url="https://github.com/projecthamster/hamster-shell-extension"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
source=('git+https://github.com/projecthamster/hamster-shell-extension.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/usr" install
}

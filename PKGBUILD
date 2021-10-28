# Maintainer: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: ryanvade
pkgname=gnome-shell-extension-hibernate-status-git
pkgver=1.10.r18.g32008bc
pkgrel=1
pkgdesc="GNOME Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hibernate-status')
conflicts=('gnome-shell-extension-hibernate-status')
source=('git+https://github.com/arelange/gnome-shell-extension-hibernate-status.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}

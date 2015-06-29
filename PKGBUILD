# Contributor: Dave Reisner <d@falconindy.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=inotail-git
pkgver=r270.a449425
pkgrel=1
pkgdesc="An inotify based implementation of tail."
arch=('i686' 'x86_64')
url="http://distanz.ch/inotail"
license=('GPL')
makedepends=('git')
provides=('inotail')
conflicts=('inotail')
source=("$pkgname::git+https://gitorious.org/inotail/inotail.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make prefix="$pkgdir/usr" install
}


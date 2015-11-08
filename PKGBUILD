# Maintainer: Simon Gomizelj <simongmzlj@gmail.com>

pkgname=gpg-tools-git
pkgver=1
pkgrel=1
pkgdesc="Wrapper for gpg-agent integration"
arch=('i686' 'x86_64')
url="http://github.com/vodik/gpg-tools"
license=('GPL')
depends=('gnupg')
makedepends=('git' 'ragel')
conflicts=('gpg-tools')
provides=('gpg-tools')
source=('git+git://github.com/vodik/gpg-tools.git')
sha1sums=('SKIP')

pkgver() {
  cd "gpg-tools"
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  make -C "gpg-tools"
}

package() {
  make -C "gpg-tools" DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et

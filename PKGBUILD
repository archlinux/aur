# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit
pkgname=hashpipe-git
pkgver=r1.dc11b62
pkgrel=1
pkgdesc="Verify hashes in pipeline"
arch=('x86_64')
url="https://git.zx2c4.com/hashpipe/"
license=('GPL-2.0-only')
depends=('openssl')
makedepends=('git')
source=("git+https://git.zx2c4.com/hashpipe.git")
sha256sums=('SKIP')

pkgver() {
  cd hashpipe
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd hashpipe
  make
}

package() {
  cd hashpipe
  make install PREFIX=/usr DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD:

# Maintainer: Score_Under <seejay 11@gmail com>
pkgname=pdpmake-git
pkgver=2.0.0.3.g94ee7a8
pkgrel=1
pkgdesc="POSIX-conformant make implementation for testing makefile compatibility"
arch=(x86_64)
license=(Unlicense)
url=https://frippery.org/make/
depends=()
makedepends=(gcc make git)
optdepends=()
source=("git+https://github.com/rmyorston/pdpmake.git")  # Unfortunately, the author's original site is ipv6-only, which makes it inaccessible to much of the UK.
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe | sed s/-/./g
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make install DESTDIR="$pkgdir" PREFIX=/usr
}

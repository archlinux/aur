# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=r1444.cfcc227
pkgrel=2
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64' 'aarch64')
url='https://harelang.org/'
license=('GPL3')
depends=('qbe')
makedepends=('git')
_commit='cfcc22785c94716c0e96be23081d8bfd1f6c0466'
source=("git+https://git.sr.ht/~sircmpwn/harec#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd harec

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd harec

  ./configure --prefix=/usr

  make
}

check() {
  cd harec

  make check
}

package() {
  cd harec

  make DESTDIR="$pkgdir" install
}

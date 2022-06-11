# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=r1325.98ec114
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64')
url='https://harelang.org/'
license=('GPL3')
depends=('qbe')
makedepends=('git')
_commit='98ec114e71df484f4e285be31be9569a6090b44a'
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

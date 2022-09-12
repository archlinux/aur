# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=harec
pkgver=r1363.987ceb7
pkgrel=1
pkgdesc='The Hare programming language - bootstrapped compiler'
arch=('x86_64')
url='https://harelang.org/'
license=('GPL3')
depends=('qbe')
makedepends=('git')
_commit='987ceb7928c8ec2b3d191963a87c6d9f4a383816'
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

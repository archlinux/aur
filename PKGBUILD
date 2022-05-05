# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=npt
pkgver=1.1.1
pkgrel=1
pkgdesc='ANSI Common Lisp implementation'
arch=('x86_64')
url='https://github.com/nptcl/npt'
license=('Unlicense')
depends=('glibc')
makedepends=('git')
_commit='55cff1db7e6f12f7e87e8ab26393792d33734d62'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  ./bootstrap.sh

  ./configure --prefix=/usr

  make
}

package() {
  cd "$pkgname"

  make install DESTDIR="$pkgdir"  
}

# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=dcfldd
pkgver=1.9.1
pkgrel=1
pkgdesc='DCFL (DoD Computer Forensics Lab) dd replacement with hashing'
arch=('x86_64')
url='https://github.com/resurrecting-open-source-projects/dcfldd/'
license=('GPL')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/resurrecting-open-source-projects/dcfldd/archive/v$pkgver.tar.gz")
sha256sums=('efb9406b7186cbe6c3edf8ff438ff37c915b21dad026bd27ee4f4cc5a6644bd8')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

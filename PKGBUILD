# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=dcfldd
pkgver=1.7
pkgrel=1
pkgdesc='DCFL (DoD Computer Forensics Lab) dd replacement with hashing'
arch=('x86_64')
url='https://dcfldd.sourceforge.net/'
license=('GPL')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/resurrecting-open-source-projects/dcfldd/archive/v$pkgver.tar.gz")
sha256sums=('6c4654407b7ec0c3328f79dc1a31365c22899a6aac23cb8ac4cb15441c71aa3e')

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

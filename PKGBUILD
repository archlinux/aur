# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=dcfldd
pkgver=1.7.1
pkgrel=1
pkgdesc='DCFL (DoD Computer Forensics Lab) dd replacement with hashing'
arch=('x86_64')
url='https://dcfldd.sourceforge.net/'
license=('GPL')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/resurrecting-open-source-projects/dcfldd/archive/v$pkgver.tar.gz")
sha256sums=('7eb0c00f71b559f36a69249a3c2d48920aa70f5099388e814047a73a3cef9064')

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

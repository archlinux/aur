# Maintainer: Marco Pompili <aur@mg.odd.red>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Paul Mattal <pjmattal@elys.com>

pkgname=dcfldd
pkgver=1.9.2
pkgrel=1
pkgdesc='DCFL (DoD Computer Forensics Lab) dd replacement with hashing'
arch=('x86_64')
url='https://github.com/resurrecting-open-source-projects/dcfldd/'
license=('GPL')
depends=('glibc')
source=($pkgname-$pkgver.tar.gz::"https://github.com/resurrecting-open-source-projects/dcfldd/archive/v$pkgver.tar.gz")
sha256sums=('52468122e915273eaffde94cb0b962adaefe260b8af74e98e1282e2177f01194')

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

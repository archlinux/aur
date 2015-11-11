# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
#
# Repository: https://github.com/fhs/archlinux-packages
pkgname=9mount
pkgver=1.3
pkgrel=3
pkgdesc="A set of SUID tools for mounting 9p filesystems via v9fs."
arch=('i686' 'x86_64')
url="http://sqweek.net/code/9mount/"
license=('ISC')
depends=('glibc')
source=("http://sqweek.net/9p/$pkgname-$pkgver.tar.gz")
md5sums=('711a0a6f4d076c8275596171b0a315d0')
sha256sums=('820d80b9b478d05ecb022ad658477b37cfc2414a8669c3af17d192a522064c17')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make prefix="$pkgdir/usr" install
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:

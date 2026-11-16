# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: masutu <masutu dot arch at gmail dot com>

pkgname=xdf
pkgver=1.6.40
pkgrel=1
pkgdesc="An exquisite version of df, reporting file system disk space usage."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/$pkgname"
license=('Apache-2.0')
depends=('glibc' 'libxcrypt')

source=("$url/files/$pkgname-$pkgver.tar.gz")
sha256sums=('d3b756b055523d239826d6482fd8313aeef33d7ca72d7649beb5bc5a3ff8c38f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make  
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  for f in xdf xdf128; do
    install -Dm 755 bin/"$f" $pkgdir/usr/bin/"$f"
  done

  install -Dm 644 man/xdf.1 $pkgdir/usr/share/man/man1/xdf.1
}

# vim:set ts=2 sw=2 et:

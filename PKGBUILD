# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Past Maintainer: Jianing Yang <jianingy.yang @gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=cpuid
pkgver=20150606
pkgrel=1
pkgdesc="Linux tool to dump x86 CPUID information about the CPU(s)"
url="http://www.etallen.com/cpuid.html"
license=('GPL')
arch=('i686' 'x86_64')
depends="glibc"
groups=('system')
source=("http://www.etallen.com/$pkgname/$pkgname-$pkgver.src.tar.gz")
md5sums=('9df0752a2e3bb40ab4db694f6fa7add9')

build () {
  cd "$srcdir/$pkgname-$pkgver" || exit 1
  make || exit 1
}

package () {
  cd "$srcdir/$pkgname-$pkgver" || exit 1
  make BUILDROOT=$pkgdir install || exit 1
}

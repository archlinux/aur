# Maintainer: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Jianing Yang <jianingy.yang @gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>

pkgname=cpuid
pkgver=20140123
pkgrel=1
pkgdesc="Linux tool to dump x86 CPUID information about the CPU(s)"
url="http://www.etallen.com/cpuid.html"
license=('GPL')
arch=('i686' 'x86_64')
groups=('system')
source=("http://www.etallen.com/$pkgname/$pkgname-$pkgver.src.tar.gz")
md5sums=('f1a6946a1ece87928ddd1d1e3b06ed4b')
build () {
  cd "$srcdir/$pkgname-$pkgver" || exit 1
  make || exit 1
}

package () {
  cd "$srcdir/$pkgname-$pkgver" || exit 1
  make BUILDROOT=$pkgdir install || exit 1
}

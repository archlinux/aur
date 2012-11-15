# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=erlang-cl
pkgver=1.0
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='OpenCL binding'
url="http://github.com/tonyrog/cl"
license=('custom:unknown')
depends=('erlang' 'libcl' 'bash')
replaces=('cl')
makedepends=('opencl-headers')
source=("$pkgname-$pkgver.tar.gz::https://nodeload.github.com/tonyrog/cl/tarball/master")
md5sums=('62960d4b8ce47be7d2e3898b99a30fd1')
_dirname='tonyrog-cl-bba7b77'

build() {
  cd "$srcdir/$_dirname"

  make

  cd c_src
  rm config.*
}

package() {
  cd "$srcdir/$_dirname"

  mkdir -p "$pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver"
  cp -r * "$pkgdir/usr/lib/erlang/lib/$pkgname-$pkgver"

  #install -Dm644 license.terms "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

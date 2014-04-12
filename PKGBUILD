# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=erlang-cl
pkgver=1.2.1
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc='OpenCL binding for Erlang'
url='http://github.com/tonyrog/cl'
license=('MIT')
depends=('erlang' 'libcl' 'bash')
replaces=('cl')
makedepends=('opencl-headers' 'rebar' 'git')
source=("$pkgname::git://github.com/tonyrog/cl.git#tag=cl-1.2.1")
md5sums=('SKIP')

build() {
  cd "$pkgname"

  rebar compile
}

package() {
  cd "$pkgname"

  mkdir -p "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  cp -r * "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

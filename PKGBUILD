# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=erlang-cl
pkgver=1.2.1
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='OpenCL binding for Erlang'
url='http://github.com/tonyrog/cl'
license=('MIT')
depends=('erlang' 'libcl' 'bash')
replaces=('cl')
makedepends=('opencl-headers' 'rebar')
source=("https://github.com/tonyrog/cl/archive/cl-$pkgver.zip")
sha256sums=('63d720995f5bfa9f6a11211bb0ec400ad28799d127d2a642f06ee33769b145ab')

build() {
  cd "cl-cl-$pkgver/c_src"

  rebar compile
  #make configure
  #./configure --with-wordsize="$_wordsize" --prefix=/usr
  #[ $CARCH = x86_64 ] && make all64 || make all32
  #rm config.*
}

package() {
  cd "cl-cl-$pkgver"

  mkdir -p "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  cp -r * "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

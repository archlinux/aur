# Maintainer: Benjamin M. <benmoran56@gmail.com>
pkgname=recdvb
pkgver=1.3.0
pkgrel=3
pkgdesc='Simple command-line utility to record DVB streams.'
arch=('any')
url='http://github.com/k-pi/recdvb'
license=('GPL3')
makedepends=('git')
optdepends=('libarib25: b25 decoding support. Must rebuild recdvb package after installing libarib25.')
provides=('recdvb')
conflicts=('recdvb-git')
source=('git://github.com/k-pi/recdvb.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$provides"
  chmod +x autogen.sh
  ./autogen.sh
  ./configure --enable-b25
  make
}

package() {
  cd "$srcdir/$provides"
  install -D -m0755 recdvb "$pkgdir/usr/bin/recdvb"
  install -D -m0755 recdvbctl "$pkgdir/usr/bin/recdvbctl"
}



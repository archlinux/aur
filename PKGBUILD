# Maintainer: Benjamin M. <benmoran56@gmail.com>
# Maintainer: Haruki Ota <ootaharuki99[at]gmail.com>
pkgname=recdvb
pkgver=1.3.3
pkgrel=1
pkgdesc='Simple command-line utility to record DVB streams.(no b25 support)'
arch=('i686' 'x86_64')
url='http://github.com/k-pi/recdvb'
license=('GPL3')
depends=('glibc')
provides=('recdvb')
conflicts=('recdvb-b25')
source=('https://github.com/k-pi/recdvb/archive/v1.3.3.tar.gz')
md5sums=('7149cba23942453fad9de3be5d2206a9')

build() {
  cd "recdvb-$pkgver"

  chmod +x autogen.sh
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "recdvb-$pkgver"

  install -D -m 755 recdvb "$pkgdir/usr/bin/recdvb"
  install -D -m 755 recdvbctl "$pkgdir/usr/bin/recdvbctl"
  install -D -m 755 recdvbchksig "$pkgdir/usr/bin/recdvbchksig"
}



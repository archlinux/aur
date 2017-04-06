# Maintainer: Haruki Ota <ootaharuki99[at]gmail.com>
pkgname=recdvb-b25
pkgver=1.3.3
pkgrel=3
pkgdesc='Simple command-line utility to record DVB streams. (b25 decoding enabled)'
arch=('i686' 'x86_64' 'armv7h')
url='http://github.com/k-pi/recdvb'
license=('GPL3')
depends=('libarib25-git')
provides=('recdvb')
conflicts=('recdvb')
source=('https://github.com/k-pi/recdvb/archive/v1.3.3.tar.gz')
md5sums=('7149cba23942453fad9de3be5d2206a9')

build() {
  cd "recdvb-$pkgver"

  chmod +x autogen.sh
  ./autogen.sh
  ./configure --enable-b25
  make
}

package() {
  cd "recdvb-$pkgver"

  install -D -m 755 recdvb "$pkgdir/usr/bin/recdvb"
  install -D -m 755 recdvbctl "$pkgdir/usr/bin/recdvbctl"
  install -D -m 755 recdvbchksig "$pkgdir/usr/bin/recdvbchksig"
}


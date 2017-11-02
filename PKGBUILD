# Maintainer: Benjamin M. <benmoran56@gmail.com>
# Maintainer: Haruki Ota <ootaharuki99[at]gmail.com>
pkgname=recdvb
pkgver=1.3.3
pkgrel=2
pkgdesc='Simple command-line utility to record DVB streams.'
arch=('i686' 'x86_64' 'armv7h')
url='http://github.com/k-pi/recdvb'
license=('GPL3')
# If you do not want to enable b25 support, 'libarib25-git' is not depended.
depends=('glibc' 'libarib25-git')
source=('https://github.com/k-pi/recdvb/archive/v1.3.3.tar.gz')
md5sums=('7149cba23942453fad9de3be5d2206a9')

build() {
  cd "recdvb-$pkgver"

  chmod +x autogen.sh
  ./autogen.sh
# If you do not want to enable b25 support, remove the flag '--enable-b25'.
  ./configure --enable-b25
  make
}

package() {
  cd "recdvb-$pkgver"

  install -D -m 755 recdvb "$pkgdir/usr/bin/recdvb"
  install -D -m 755 recdvbctl "$pkgdir/usr/bin/recdvbctl"
  install -D -m 755 recdvbchksig "$pkgdir/usr/bin/recdvbchksig"
}



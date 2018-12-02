# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=flvstreamer
pkgver=2.1c1
pkgrel=5
pkgdesc="Open source command-line RTMP client"
url="https://savannah.nongnu.org/projects/flvstreamer"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('glibc')
source=("https://download.savannah.nongnu.org/releases/flvstreamer/source/$pkgname-$pkgver.tar.gz")
sha256sums=('e90e24e13a48c57b1be01e41c9a7ec41f59953cdb862b50cf3e667429394d1ee')

build() {
  cd "$srcdir/$pkgname"
  make flvstreamer
  make streams
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 flvstreamer "$pkgdir/usr/bin/flvstreamer"
  install -Dm755 streams "$pkgdir/usr/bin/streams"
}

# vim:set ts=2 sw=2 et:

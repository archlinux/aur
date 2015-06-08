# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=ampsharp
pkgver=2.0.4
pkgrel=1
pkgdesc="Asynchronous Messaging Protocol library for the CLI"
arch=(i686 x86_64)
url="https://launchpad.net/$pkgname"
license=('MIT')
depends=('mono' 'log4net')
source=("https://launchpad.net/ampsharp/2.0/$pkgver/+download/AMPSharp-src-$pkgver.tar.gz")
sha256sums=('c277012c340baf174fbc147cf3fe4e5ddd5dda02228e81ca03871d4f81fcedbc')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  mkdir $pkgdir/usr $pkgdir/usr/lib
  gacutil -i AMPSharp.dll -root $pkgdir/usr/lib
}

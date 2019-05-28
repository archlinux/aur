# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.7.7
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('4f81defae2d1aa2ccd84bcc484bcc56c9a5c97d8130c0e5fe8d932979d1d686b')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o streamstatus
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

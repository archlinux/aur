# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.6.0
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('733aaba6f683dac4e9f85ceecc3917bb5674194ce6498e61687a6b36927468e5')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o streamstatus
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

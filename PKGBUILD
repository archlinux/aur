# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.2.0
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('5ec671d6b5dc4235dd9aaabc50edb792c3489b1237d2e16a0950429a90c20408')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

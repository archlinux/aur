# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.1.2
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('ed56a27754ea664052a6ab841d09bc078cbdfebfbd88fa5e7cda2e7b36792e10')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

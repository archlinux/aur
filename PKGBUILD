# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.7.1
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('7bcefd77d101cb96a5a5c841936d1073d7b4b23bfde2c2c1ee849a69738556ae')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o streamstatus
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

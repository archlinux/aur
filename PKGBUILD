# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.3.0
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('1fa987b58dfacdb0bee31e06e8e4f39d221a75c6d74bc70723b11720bc30504f')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

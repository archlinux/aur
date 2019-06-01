# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.8.0
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('36d8679eeaf0c0c42722ac3769cea5926419fdbb0ff03e50552ba7ff56314e77')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o streamstatus
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

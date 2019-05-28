# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=streamstatus
pkgver=0.7.5
pkgrel=1
pkgdesc='cli tool to check if your favorite twitch streamers are online.'
arch=('x86_64')
url='https://github.com/andresterba/streamstatus'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andresterba/streamstatus/archive/v${pkgver}.tar.gz")
sha256sums=('12e87be874a3045f0d4e2e51edbb23bb2348231cd8398bf8a0aec6830e79e76a')

build(){
  cd "$srcdir/$pkgname-$pkgver"
  go build -o streamstatus
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-compress
pkgver=0.25.2.0
pkgrel=1
pkgdesc='Compression algorithms for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-compress'
license=('MPL-2.0')
depends=('hare')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~sircmpwn/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('0a6a86bc02299f1f15bd37ddb6573b187987d43ae4fc7be452b9f92d1aefdb21e09735443d61b84e2c761e25551efd6137df5c064b4aa0d2d9278598bf1a27b8')

check() {
  cd "$pkgname-$pkgver"

  make check
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}

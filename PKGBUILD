# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=declick
pkgver=0.6.5
pkgrel=1
pkgdesc="Dynamic Digital Declicker for wave files"
arch=('x86_64')
url="http://home.snafu.de/wahlm/dl8hbs/declick.html"
license=('GPL')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::http://home.snafu.de/wahlm/dl8hbs/declick-${pkgver}.tar.gz")
sha256sums=('ce049078fd39ee68da9297cf0fa05ebce48c242934db8da1b87c2a6cdc985786')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 declick "${pkgdir}/usr/bin/declick"
}
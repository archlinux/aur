# Maintainer: Luong Thanh Lam <ltlam93@gmail.com>
# Contributor: Tran Van Cong

pkgname=ibus-bamboo
pkgver=0.5.5
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/BambooEngine/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6e44641461bcff8d78b7d9c13948fbfdffa90d945d6a0ed5ec03cdffb550fb91')
options=('!strip')
conflicts=(ibus-bamboo-git)

build() {
  cd "$pkgname-$pkgver"

  make
}


package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

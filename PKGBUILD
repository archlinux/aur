# Maintainer: Luong Thanh Lam <ltlam93@gmail.com>
# Contributor: Tran Van Cong

pkgname=ibus-bamboo
pkgver=0.5.6
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/BambooEngine/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('eaebd63b8e3a6c1be867b5a0e035483f3f7b40c418936269e4761fca71c7d770')
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

# Maintainer: Luong Thanh Lam <ltlam93@gmail.com>
# Contributor: Tran Van Cong

pkgname=ibus-bamboo
pkgver=0.5.4
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/BambooEngine/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3b945c58e5129081e1cc899f81edccf05c9f579fc429e1bdc8466469441d93cf')
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

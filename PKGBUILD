# Maintainer: Luong Thanh Lam <ltlam93@gmail.com>
# Contributor: Tran Van Cong

pkgname=ibus-bamboo
pkgver=0.5.8
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
depends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/BambooEngine/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e4fbf2df5d6bab75323bc8ad1dd6f2d1e847db41a49b63e69169acb1ba9e94e5')
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

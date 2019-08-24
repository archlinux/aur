pkgname=ibus-bamboo
pkgver=0.5.4
pkgrel=1
pkgdesc='A Vietnamese IME for IBus'
arch=(any)
license=(GPL3)
url="https://github.com/BambooEngine/ibus-bamboo"
optdepends=('ibus')
makedepends=('go' 'libx11' 'libxtst')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/BambooEngine/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
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

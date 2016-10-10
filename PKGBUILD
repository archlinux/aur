# Maintainer: Miguel Hernandez <michelangelo93@gmail.com.com>
pkgname=nvidia-led
pkgver=1.0.0
pkgrel=1
pkgdesc="Awesome effects for NVIDIA GeForce GTX LEDs"
arch=(any)
url="https://github.com/Madh93/nvidia-led"
license=('GPL3')
depends=('git'
        'nvidia-utils>=331.38')
makedepends=('git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/Madh93/nvidia-led/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm 755 $pkgname.sh ${pkgdir}/usr/bin/$pkgname
}

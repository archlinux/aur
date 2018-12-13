# Maintainer: David Runge <dave@sleepmap.de>
pkgname=realtime-suggestions
pkgver=0.1.0
pkgrel=1
pkgdesc="Script suggesting improvements for realtime audio"
arch=('any')
url="https://github.com/linuxaudio/realtime-suggestions"
license=('GPL3')
groups=('realtime')
depends=('bash')
checkdepends=('shellcheck')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxaudio/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1d6f8d6ab5bc3feafe606e57ca8e21f0c105f9bf32e274eefb093658956f1f55cad9c6e7353dcb59a9076ca5d07e2ae65199230963a4c494e4b3de74f8d97a89')
validpgpkeys=()

check() {
  cd "$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX='/usr' DESTDIR="$pkgdir/" install
}

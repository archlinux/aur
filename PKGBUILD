# Maintainer: Jan Jasper de Kroon <jajadekroon AT gmail DOT com>
# Contributor: Jan Jasper de Kroon <jajadekroon AT gmail DOT com>
# Contributor: Arnaud Ferraris

pkgname=pinephone-dev-tools
pkgver=0.92
pkgrel=1
pkgdesc="Configures USB Gadget driver and initiates a USB network interface"
arch=('any')
url="https://github.com/PsychoGame/pinephone-dev-tools"
license=('GPL')
depends=('dnsmasq')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/PsychoGame/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('c1b1bbc82430622ebba5acd50c1410e61ac22bbdef3fbe960c315cb7a48c4acc17215a3c7b5e3f63936bf1c7581b1f73f955920e4e404c18a474c98374c53559')
b2sums=('fe42c047b6ecdcda3bfd8b3e9b1fb06abfbc865394d2f0b4bfdc513fab0cf7ea878dd52c85c3c8946c9f2f7bd32b75958d185b6629c7d080e31f680d36d1cb30')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


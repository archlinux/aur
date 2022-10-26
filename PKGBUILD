# Maintainer: Lancia Greggori <lanciagreggori@gmail.com>
pkgname='herbe'
pkgver='1.0.0'
pkgrel=1
pkgdesc='Daemon-less notifications without D-Bus'
arch=('x86_64')
url='https://github.com/dudik/herbe'
license=('MIT')
depends=('libx11')
conflicts=('herbe' 'herbe-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dudik/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('78e454159050c86e030fb5a6cf997ac914345210cdf5a4ca4d7600c5296b7f76')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX='/usr' DESTDIR="${pkgdir}" install
}

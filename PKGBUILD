# Maintainer: Taha Farahani <iotahacodes@gmail.com>
pkgname=arvan
pkgver=1.0.0
pkgrel=1
pkgdesc="cli tool for managing ArvanCloud services"
arch=('x86_64')
url="https://github.com/arvancloud/cli"
license=('unknown')
source=("https://github.com/arvancloud/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('3b18cffb52b3b5a13538076e20e403a10993c9d6515e6a327f1249ac1c5b3735')

prepare() {
	mkdir -p $HOME/.arvan
	touch $HOME/.arvan/config
	tar -xvf "${srcdir}/${pkgname}_${pkgver}_linux_amd64.tar.gz" -C "${srcdir}"
}

package() {
	cd $srcdir
	install -Dm755 arvan $pkgdir/usr/bin/arvan
}

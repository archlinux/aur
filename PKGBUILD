# Maintainer: Taha Farahani <iotahacodes@gmail.com>
pkgname=arvan
pkgver=1.0.1
pkgrel=3
pkgdesc="cli tool for managing ArvanCloud services"
arch=('x86_64')
url="https://github.com/arvancloud/cli"
license=('unknown')
options=('!strip')
source=("https://github.com/arvancloud/cli/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('eb53c93fd9fa77c13b527251100039a0daa66b6eaa865f67ba2f1a1cac073db9')

prepare() {
	mkdir -p $HOME/.arvan
	cp config $HOME/.arvan/config
	tar -xf "${srcdir}/${pkgname}_${pkgver}_linux_amd64.tar.gz" -C "${srcdir}"
}

package() {
	install -Dm755 "${srcdir}/arvan" "${pkgdir}/usr/bin/arvan"
}

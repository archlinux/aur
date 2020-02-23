# Maintainer: David Horvath <horvath.david987 at gmail dot com>
pkgname='mqtt-explorer'
pkgver=0.3.5
pkgrel=1
pkgdesc="A comprehensive and easy-to-use MQTT Client"
arch=('any')
url="https://mqtt-explorer.com/"
license=('CCPL:by-nd')
groups=()
depends=('npm'
         'yarn')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=("~/.config/MQTT-Explorer/settings.json")
options=(!strip)
install=
changelog=
source=("$pkgname-${pkgver}.tar.gz::https://github.com/thomasnordquist/MQTT-Explorer/archive/v$pkgver.tar.gz"
        "$pkgname-${pkgver}-desktop.tar.gz::https://github.com/dave12311/mqtt-explorer.desktop/archive/1.0.tar.gz")
validpgpkeys=("AEBB1D24629030C6"
              "4AEE18F83AFDEB23")

build() {
	cd "MQTT-Explorer-${pkgver}"
	yarn
	yarn build
}

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -r MQTT-Explorer-${pkgver}/* $pkgdir/usr/share/$pkgname/
	mkdir -p "$pkgdir/usr/share/applications"
	cp mqtt-explorer.desktop-1.0/mqtt-explorer.desktop $pkgdir/usr/share/applications/
}
md5sums=('66b04e6991416cf8be67c0d8c3706477'
         'd1edbfd617569f74c3cb8e25fca500de')

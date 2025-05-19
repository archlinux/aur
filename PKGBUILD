#Maintainer:	mumi jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>

pkgname=isd-appimage
pkgver=v0.5.1
pkgrel=2
pkgdesc='A better way to work with systemd units.'
url='https://github.com/isd-project/isd'
arch=('x86_64')
optdepends=("vim")
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver::$url/releases/download/${pkgver}/isd.x86_64-linux.AppImage")
sha512sums=('91b4f8066e5ccc6ef5ff6a1957ed45ee100fe1e30a002f5d351673bc6d0dfff66fa6dd4ba7c467ecc2d6300f70eecc7ef74c926ed21024dc48c6e40f41884b2c')
conflicts=("isd")
provides=('isd')
options=(!strip)

check() {
	if [[ ! -f ${srcdir}/${pkgname}-${pkgver} ]]; then
		exit 1
	fi
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/isd"
}

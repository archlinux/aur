#Maintainer:	mumi jim <echo "=02bj5yav9Gb0V3bA1Waq9VatVXb" | rev | base64 -d>

pkgname=isd-appimage
pkgver=v0.6.2
pkgrel=1
pkgdesc='A better way to work with systemd units.'
url='https://github.com/isd-project/isd'
arch=('x86_64')
optdepends=("vim")
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver::$url/releases/download/${pkgver}/isd.x86_64-linux.AppImage")
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
sha256sums=('4fa21fad7712a20932b7a78f3c184f0b8a6b0c8b829de06f52801a51ae982e4e')

#Maintainer:	Giteeajake <giteeajake@qq.com>

pkgname=isd-appimage
pkgver=v0.4.1
pkgrel=1
pkgdesc='A better way to work with systemd units.'
url='https://github.com/isd-project/isd'
arch=('x86_64')
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver::$url/releases/download/v0.4.1/isd.x86_64-linux.AppImage")
sha512sums=('1ebd6c13c0eaeefdee52a9107c87862156be8f1c95c2f39204478ee03d7e9a423d33175613b7d520ac91c7a6f2f8f2bdf46ffce6c47bbfd866f6b62e960407da')
conflicts=("isd")
provides=('isd')

check() {
	if [[ ! -f ${srcdir}/${pkgname}-${pkgver} ]]; then
		exit 1
	fi
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/isd"
}

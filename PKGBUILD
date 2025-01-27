#Maintainer:	Giteeajake <giteeajake@qq.com>

pkgname=isd-appimage
pkgver=v0.3.0
pkgrel=2
pkgdesc='A better way to work with systemd units.'
url='https://github.com/isd-project/isd'
arch=('x86_64')
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver::$url/releases/download/v0.3.0/isd.AppImage")
sha512sums=('c1ea2620359c9dce8794e855b3de9e3de6dce96f63c9c6bbf07842781643f67436e3e12f1f25da0ba93d95c70428afce546bc036f58ec9b5070093279cf29d16')
conflicts=("isd")

check() {
	if [[ ! -f ${srcdir}/${pkgname}-${pkgver} ]]; then
		exit 1
	fi
}

package() {
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/isd"
}

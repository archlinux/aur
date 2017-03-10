# Maintainer: Yardena Cohen <yardenack at gmail dot com>

gitname=arch-https-mirrors
pkgname=${gitname}-git
pkgver=0
pkgrel=1
pkgdesc="arch linux mirrors which support https"
arch=('any')
url="https://github.com/yardenac/${gitname}"
license=('unknown')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}

package() {
	install -d -m755 "${pkgdir}/etc/pacman.d"
	install -D -m644 "${srcdir}/mirrorlist.https-only" "${pkgdir}/etc/pacman.d/"
}

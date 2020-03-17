# Maintainer: Reese Wang <thuwrx10 at gmail dot com>

pkgname=mkinitcpio-etc
pkgver=r3.4c6714f
pkgrel=1
pkgdesc="mkinitcpio hook for mounting NFS share on /etc"
url="https://github.com/ReeseWang/mkinitcpio-etc"
arch=(any)
license=('GPL3')
makedepends=('git')
depends=('syslinux')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.install ${pkgdir}/usr/lib/initcpio/install/etc
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.hook ${pkgdir}/usr/lib/initcpio/hooks/etc
}


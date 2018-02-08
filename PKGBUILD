pkgname=initcpio-overlayfs
pkgver=r2.f37f141
pkgrel=1
pkgdesc="Initcpio hook for overlayfs"
url="https://github.com/felixsinger/initcpio-overlayfs"
arch=(any)
license=('GPL3')
makedepends=('git')
depends=()
source=("git+https://github.com/felixsinger/initcpio-overlayfs.git")
sha512sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.install ${pkgdir}/usr/lib/initcpio/install/overlayfs
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.hook ${pkgdir}/usr/lib/initcpio/hooks/overlayfs
}


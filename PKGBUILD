pkgname=mkinitcpio-kexec-nfs
pkgver=r2.619a2de
pkgrel=1
pkgdesc="WIP: mkinitcpio hook to kexec a kernel copied over nfs"
url="https://github.com/felixsinger/mkinitcpio-kexec-nfs"
arch=(any)
license=('GPL3')
makedepends=('git')
depends=('mkinitcpio-nfs-utils')
source=("git+https://github.com/felixsinger/mkinitcpio-kexec-nfs.git")
sha512sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.install ${pkgdir}/usr/lib/initcpio/install/kexec-nfs
	install -m755 -D ${srcdir}/${pkgname}/${pkgname}.hook ${pkgdir}/usr/lib/initcpio/hooks/kexec-nfs
}


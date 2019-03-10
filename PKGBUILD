# Maintainer: Oliver Mangold <o.mangold@gmail.com>

pkgname=kmodcache
pkgver=1.2
pkgrel=1
pkgdesc="Scripts to make a copy of installed kernel modules, which will be used for on-demand loading from then point on, thus make reboots unnecessary after kernel updates."
arch=('any')
license=('GPL3')
depends=()
makedepends=()
source=('kmodcache.conf' 'modprobe' 'make-kmod-cache' 'kmodcache.service')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
	#cd "${pkgname}"
	install -m 755 -d "$pkgdir"/usr/lib/modules "$pkgdir"/usr/lib/sysctl.d "$pkgdir"/usr/lib/systemd/system "$pkgdir"/usr/bin "$pkgdir"/usr/local/bin
	install -m 755 make-kmod-cache "$pkgdir"/usr/bin
	install -m 755 modprobe "$pkgdir"/usr/local/bin
	install -m 644 kmodcache.conf "$pkgdir"/usr/lib/sysctl.d
	install -m 644 kmodcache.service "$pkgdir"/usr/lib/systemd/system
    ln -s /var/cache/kmods "$pkgdir"/usr/lib/modules/cached
}

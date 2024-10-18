# Maintainer: Oliver Mangold <o.mangold@gmail.com>

pkgname=kmodcache
pkgver=1.5
pkgrel=1
pkgdesc="Scripts to make a copy of installed kernel modules, which will be used for on-demand loading from then point on, thus make reboots unnecessary after kernel updates."
arch=('any')
license=('GPL3')
depends=()
makedepends=()
source=(pre-upgrade post-upgrade 69-kmodcache-pre.hook 72-kmodcache-post.hook)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
	install -m 755 -d "$pkgdir"/usr/lib/kmodcache "$pkgdir"/usr/share/libalpm/hooks
	install -m 755 {pre,post}-upgrade "$pkgdir"/usr/lib/kmodcache
	install -m 644 *.hook "$pkgdir"/usr/share/libalpm/hooks
}

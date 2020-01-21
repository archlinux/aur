# Maintainer Cookie Engineer <@cookiengineer>

pkgname=simple-chroot-git
pkgver=r89.edda14f
pkgrel=1
pkgdesc="Simple chroot environment manager"
arch=(any)
url=https://github.com/mh5/simple-chroot
license=( "BSD" )
depends=('bash')
options=('!emptydirs')
source=("git+https://github.com/mh5/simple-chroot.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/simple-chroot"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/simple-chroot"
	mkdir -p "{$pkgdir}/usr/bin";
	install -Dm755 "${srcdir}/simple-chroot/simple-chroot.sh" "${pkgdir}/usr/bin/simple-chroot";
}


# Maintainer: Oskar Sveinsen

_pkgname=ps2client
pkgname=ps2client-git
pkgver=r63.11545a3
pkgrel=1
pkgdesc="Desktop clients to interact with ps2link and ps2netfs"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/ps2dev/ps2client"
license=('BSD')
groups=('ps2dev')
makedepends=('git')
provides=('ps2client')
source=('ps2client::git+https://github.com/ps2dev/ps2client')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX="${pkgdir}/usr/" install
	install -D -m644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" "doc/license.txt"
	install -D -m644 -d "doc/" "${pkgdir}/usr/share/doc/${_pkgname}"
}

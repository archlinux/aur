# Maintainer: Parker Reed <parker.l.reed@gmail.com>

pkgname=rdrview-git
_pkgname=rdrview
pkgver=20210213.b887583
pkgrel=1
pkgdesc='Command line tool to extract the main content from a webpage'
url='https://github.com/eafer/rdrview'
license=('custom')
arch=('x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
makedepends=('git')
depends=('curl' 'libxml2' 'libseccomp')
source=('git+https://github.com/eafer/rdrview.git')
sha256sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX="${pkgdir}/usr" install
}

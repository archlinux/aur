# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=skod-git
pkgver=56.fb7855a
pkgrel=1
pkgdesc="FTP client for humans."
arch=('i686' 'x86_64')
url="https://github.com/Hypsurus/skod"
license=('GPL3')
makedepends=('git' 'gcc' 'make')
conflicts=('skod')
source=("$pkgname"::'git://github.com/Hypsurus/skod.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
        install -D -m755 skod "${pkgdir}/usr/bin/skod"
        install -D -m664 doc/LICENSE "${pkgdir}/usr/share/licenses/skod/LICENSE"
}

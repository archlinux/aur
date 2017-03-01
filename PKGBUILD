# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=go-kbdgrab
pkgver=r2.3e6676f
pkgrel=1
pkgdesc='Key grabber written in golang for cleaning your keyboard'
arch=(i686 x86_64)
url='https://github.com/tonylambiris/go-kbdgrab'
license=(BSD)
makedepends=(go)
source=("git+https://github.com/tonylambiris/go-kbdgrab.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	make
}

package() {
	cd "${srcdir}/${pkgname}"

	install -m755 -D kbdgrab "${pkgdir}"/usr/bin/kbdgrab
}

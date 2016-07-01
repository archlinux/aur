# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Zanny <lordzanny@gmail.com>

pkgname=clinfo-git
pkgver=2.1.16.01.12.r2.g271b884
pkgrel=1
pkgdesc="Print all known information about all available OpenCL platforms and devices in the system"
arch=(i686 x86_64)
url="https://github.com/Oblomov/clinfo"
license=('custom:Public Domain')
depends=(libcl)
makedepends=(opencl-headers)
provides=(clinfo)
conflicts=(clinfo)
replaces=(clinfo)
source=(git+https://github.com/oblomov/clinfo.git)
md5sums=('SKIP')

function pkgver() {
	cd clinfo
	git describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cd clinfo
	make
}

package() {
	cd clinfo
	install -D -m755 clinfo "${pkgdir}/usr/bin/clinfo"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 man/clinfo.1 "${pkgdir}/usr/share/man/man1/clinfo.1"
}

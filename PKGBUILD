# Maintainer: Mehmet Ümit Özden<ozdenmehmetumit@gmail.com>
pkgname=k380-swap-keys
pkgver=1.2.1.r0.g304595f
pkgrel=1
pkgdesc="Convenient way to swap upper fn keys on Logitech K380"
arch=(any)
url="https://github.com/mehmetumit/k380-swap-keys.git"
license=('GPL3')
makedepends=(git)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
	cd "${pkgname}"
	make PREFIX="/usr/local/" TARGET_FILE="${pkgname}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

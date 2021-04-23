# Maintainer: Knut Ahlers <knut at ahlers dot me>

pkgname=librespeed-cli
pkgver=1.0.8
pkgrel=1
pkgdesc="Command line client for LibreSpeed"
arch=('i686' 'x86_64')
url="https://github.com/librespeed/speedtest-cli"
license=(LGPL3)
makedepends=(go)
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	bash build.sh
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm755 "out/${pkgname}-$(go env GOOS)-$(go env GOARCH)" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

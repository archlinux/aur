# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=0.9.8
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(any)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
optdepends=(highlight)
source=("https://github.com/walles/moar/archive/${pkgver}.tar.gz")
sha256sums=('2b21512c24a5c65d76ec1c7e7c59def9630eabf39855c9ae7c763f8d180c33b0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	go build -ldflags="-X main.versionString=${pkgver}" -o "${pkgname}"
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	go test github.com/walles/moar/m
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	
	install -dm755 "${pkgdir}/usr/bin"
	install -m755 "moar" "${pkgdir}/usr/bin/moar"
}

# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=moar
pkgver=0.9.18
pkgrel=1
pkgdesc="A pager designed to just do the right thing without any configuration."
arch=(any)
url='https://github.com/walles/moar'
license=(BSD)
makedepends=(go)
optdepends=(highlight)
checkdepends=(highlight)
source=("https://github.com/walles/moar/archive/${pkgver}.tar.gz")
sha256sums=('48f5e7871497e8677f182b6a98da01833f31e706a1fbe292c479a53cf20b9d44')

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

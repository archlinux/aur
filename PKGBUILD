# Maintainer: Filippo Berto <berto.f@protonmail.com>
pkgname=ndn-cxx
pkgver=0.6.6
pkgrel=1
# epoch=
pkgdesc="Library implementing Named Data Networking (NDN) primitives that can be used to write various NDN applications"
arch=("any")
url="https://github.com/named-data/${pkgname}"
license=('GPL')
groups=()
depends=('boost')
makedepends=('git' 'gcc' 'python' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz)
noextract=()
sha256sums=('abadd5b7599a74dbe11a4491aefe30ea4a00fdecf477c1035d5eb82ce46b8f9b')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	./waf configure
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
	
	mv "${pkgdir}/usr/local/"* "${pkgdir}/usr"
}

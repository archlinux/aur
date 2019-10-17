# Maintainer: Filippo Berto <berto.f@protonmail.com>
pkgname=ndn-tools
pkgver=0.6.4
pkgrel=2
# epoch=
pkgdesc="ndn-tools is a collection of basic tools for Named Data Networking"
arch=("any")
url="https://github.com/named-data/${pkgname}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${url}/archive/${pkgname}-${pkgver}.tar.gz")
noextract=()
sha256sums=('8fb4c6c4a5d88801105cd271fde38522dd1cd25c02d5d0f97cb9faf7004e5949')
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

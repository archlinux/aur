# Maintainer: Filippo Berto <berto.f@protonmail.com>
pkgname=ndn-tools
pkgver=0.7
pkgrel=1
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
sha256sums=('b7ef805f5532acbc312a8250466216743528da5ad09f41fc6da451b6d05ed7a3')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}

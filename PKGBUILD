# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-tools
_pkgname=ndn-tools
pkgname=ndn-tools
pkgver=0.7
pkgrel=6
# epoch=
pkgdesc="A collection of basic tools for Named Data Networking"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost' 'libpcap')
makedepends=('git' 'python')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=("${url}/archive/${_reponame}-${pkgver}.tar.gz")
noextract=()
sha256sums=('b7ef805f5532acbc312a8250466216743528da5ad09f41fc6da451b6d05ed7a3')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}-${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}

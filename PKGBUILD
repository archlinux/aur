# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-tools
_pkgname=ndn-tools
pkgname=ndn-tools
pkgver=0.7.1
pkgrel=2
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
sha256sums=('75fa841e86da3d4bb8dc8c700d1d42ea229f6f7f4e08ee9a209e5019760d32c4')
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
#  mkdir -p "${pkgdir}/usr/share/man"
#  mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/share/"
}

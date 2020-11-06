# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=ndn-cpp
_pkgname=ndn-cpp
pkgname=${_pkgname}
pkgver=0.17
pkgrel=1
# epoch=
pkgdesc="A new implementation of a Named Data Networking client library written in C++ and C. It is wire format compatible with the NDN-TLV encoding."
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost' 'sqlite' 'openssl>=1.0.2')
makedepends=('git' 'python')
checkdepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/v${pkgver}.tar.gz)
noextract=()
sha256sums=('0d0e2f17b35b887ad90383188d520eb31f12f063cb0203d5ee3b4709ed1a3c1b')
validpgpkeys=()

prepare() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	configure --prefix=/usr
}

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  make
}

#check() {
#}

package() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  DESTDIR=${pkgdir} make install
}

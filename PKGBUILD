# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=PSync
_pkgname=ndn-psync
pkgname=$_pkgname
pkgver=0.2.0
pkgrel=1
# epoch=
pkgdesc="NFD is a network forwarder that implements and evolves together with the Named Data Networking (NDN) protocol"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('ndn-cxx' 'boost')
makedepends=('git' 'gcc' 'python' 'boost' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=('valgrind: memory analysis'
            'doxygen: build documentation'
            'python-sphinx: build documentation')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=(https://github.com/named-data/${_reponame}/archive/${pkgver}.tar.gz)
noextract=()
sha256sums=('ab18f2f17df48bfc4b6baa064a826d8f1c3b1e464748a2106f47decd69183b02')
validpgpkeys=()

prepare() {
  cd "${srcdir}/${_reponame}-${pkgver}"
  ./waf configure --prefix=/usr
}

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}

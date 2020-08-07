# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=mini-ndn
_pkgname=mini-ndn
pkgname=${_pkgname}
pkgver=0.4.0
pkgrel=1
# epoch=
pkgdesc="Lightweight networking emulation tool that enables testing, experimentation, and research on the NDN platform based on Mininet"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
license=('GPL')
groups=()
depends=('boost')
makedepends=('boost' 'ndn-cxx' 'ndn-nfd' 'ndn-chronosync' 'ndn-tools' 'ndn-nlsr' 'ndn-infoedit' 'mininet-git' 'termshark' 'python-igraph' 'python-setuptools' 'python-pyndn')
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
sha256sums=('a6abcbe022b12c540584164ab68aa69192d4e15996861df1e16fda30884f60ce')
validpgpkeys=()

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
	python3 setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

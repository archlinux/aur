# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=PyNDN2
_pkgname=python-pyndn
pkgname=${_pkgname}
pkgver=2.11beta1
pkgrel=2
# epoch=
pkgdesc="A Named Data Networking client library with TLV wire format support in native Python"
arch=('i686' 'x86_64')
url="https://github.com/named-data/${_reponame}"
#license=('GPL')
groups=()
depends=('python' 'python-cryptography')
makedepends=('ndn-cxx')
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
sha256sums=('65ec3f02f28fa5b3af50fc63cdf71f3be73b4c4292a48f480d21c3b24b1ca68a')
validpgpkeys=()

build() {
  cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

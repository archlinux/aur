# Maintainer: Filippo Berto <berto.f@protonmail.com>
_reponame=infoedit
_pkgname=ndn-infoedit
pkgname=${_pkgname}-git
pkgver=5e88552
pkgrel=1
# epoch=
pkgdesc="Command Line Tools for Boost INFO Format"
arch=('i686' 'x86_64')
url="https://github.com/NDN-Routing/${_reponame}"
#license=('GPL')
groups=()
depends=('boost')
makedepends=('git' 'gcc' 'python' 'pkgconf' 'sqlite' 'openssl>=1.0.2')
checkdepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${_reponame}"
	git rev-parse --short HEAD
}

build() {
  cd "${srcdir}/${_reponame}"
	make
}

package() {
  install -dm 755 "${pkgdir}/usr/bin/"

	cd "${srcdir}/${_reponame}"
  cp "infoedit" "infoconv" "${pkgdir}/usr/bin/"
}

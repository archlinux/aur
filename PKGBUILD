# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Laura Leddin <laura+aur@llaura.de>
_pkgname=spongecase
pkgname=sponge-case-git
pkgver=v1.0.2_5_gf657b07
pkgrel=1
epoch=
pkgdesc="Converts strings to spongebob mocking case"
arch=('x86_64')
url="https://github.com/FabianTe/spongecase"
license=()
groups=()
depends=()
makedepends=('git'
             'go')
checkdepends=()
optdepends=()
provides=('spongecase')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/FabianTe/spongecase.git")
noextract=()
validpgpkeys=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

build() {
	cd "${srcdir}/${_pkgname}"
	go build -o "${srcdir}/pkg/${_pkgname}"
}

package() {
	install -Dm755 "${srcdir}/pkg/${_pkgname}" -t "${pkgdir}/usr/bin/"
}

# Maintainer: Gregoire Lodi <gregoire.lodi@gmail.com>

pkgname=elf-strings
pkgver=0.9.1
pkgrel=1
pkgdesc="elf-strings will programmatically read an ELF binary's string sections within a given binary. This is meant to be much like the strings UNIX utility, however is purpose built for ELF binaries."
arch=("x86_64")
url="https://github.com/LloydLabs/elf-strings"
license=("GPL")
groups=()
depends=()
makedepends=("go")
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname"::"git+${url}.git")
noextract=()
md5sums=("SKIP") #autofill using updpkgsums

build() {
  cd "$pkgname"

  GOPATH="$PWD" GOBIN="$PWD" go get
  GOPATH="$PWD" GOBIN="$PWD" go build
}

package() {
  cd "${srcdir}/${pkgname}"
  echo "installing ${pkgname} to ${pkgdir}"
  install -Dm 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

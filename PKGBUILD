# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=linux-command-gpt-git
pkgver=1.0.r6.59125fa
pkgrel=2
epoch=
pkgdesc="Get Linux commands in natural language with the power of ChatGPT."
arch=(any)
url="https://github.com/asrul10/linux-command-gpt.git"
license=('MIT')
groups=()
depends=(go)
makedepends=(go)
checkdepends=()
optdepends=()
provides=(linux-command-gpt-git)
conflicts=(linux-command-gpt)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # Compile
   cd "${srcdir}"/linux-command-gpt
   go build -o lcg
   
   # Add it to /usr/bin to make it executable
   install -Dm755 "${srcdir}/linux-command-gpt/lcg" "${pkgdir}/usr/bin/lcg"
}

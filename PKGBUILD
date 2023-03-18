# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=linux-command-gpt-git
pkgver=1.0.r2.6a8403b
pkgrel=1
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
   sudo cp -nf "${srcdir}"/linux-command-gpt/lcg /usr/bin
}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=linux-command-gpt
pkgver=0.1.2
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
provides=(linux-command-gpt)
conflicts=(linux-command-gpt-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url#commit=952eee1a29219839df0c7fb2f442e60d41163551")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

package() {
   # Compile stable version
   cd "${srcdir}"/linux-command-gpt
   go build -o lcg
   
   # Add it to /usr/bin to make it executable
   sudo cp "${srcdir}"/linux-command-gpt/lcg /usr/bin/lcg
}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=chatgpt-shell-cli-git
pkgver=1.0.r.
pkgrel=1
epoch=
pkgdesc="Use OpenAI's ChatGPT and DALL-E from the terminal."
arch=(any)
url="https://github.com/0xacx/chatGPT-shell-cli.git"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(chatgpt-shell-cli-git)
conflicts=(chatgpt-shell-cli)
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
   cd "${srcdir}"/chatGPT-shell-cli
   
   # Add it to /usr/local/bin to make it executable
   sudo cp "${srcdir}"/chatGPT-shell-cli/chatgpt.sh /usr/local/bin/chatgpt
}

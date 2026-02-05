# Maintainer: Prasanna Venkadesh <prasmailme@gmail.com>

pkgname=battinfo-git
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="battinfo is a CLI tool & nim library to get battery detials."
arch=('x86_64')
url="https://gitlab.com/prashere/battinfo"
license=('GPL')
groups=()
depends=()
makedepends=('make' 'git' 'nim')
checkdepends=()
optdepends=()
provides=(battinfo)
conflicts=(battinfo)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
	cd battinfo
	make build_bin
}

package() {
	cd battinfo
	nimble install -p "--opt:size" --noRebuild  # required to install library modules
	install -Dm711 bin/battinfo  "${pkgdir}/usr/local/bin/battinfo" # copy the binary file to corresponding location
}

# Maintainer: Fronkles McFranko <mrelfranko@disroot.org>
# Maintainer: gamestime102 < >
pkgname=afetch-git
_pkgname=afetch
pkgver=v2.2.0
pkgrel=1
epoch=
pkgdesc="Fast and simple system info written in C, that can be configured at compile time by editing the config.h file"
arch=("any")
url="https://gitlab.com/gamestime102/afetch/afetch"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'gcc' 'make')
checkdepends=()
optdepends=()
provides=(afetch)
conflicts=(afetch)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://gitlab.com/gamestime102/afetch/afetch"
)
noextract=()
md5sums=("SKIP")


build() {
    cd "$_pkgname"
    make all
}

package() {
    mkdir "${pkgdir}/usr/bin" -p
    mkdir "${pkgdir}/usr/share/man/man1" -p

    cd "$_pkgname"
    make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}

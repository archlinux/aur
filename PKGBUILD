# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Gabriel Acosta <acostadariogabriel@gmail.com>
pkgname=st-gabox-git
pkgver=.r1139.e88f113
pkgrel=1
epoch=
pkgdesc="My personal build of st"
arch=(x86_64 i686)
url="https://github.com/centaurialpha/st.git"
license=('MIT')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(st)
conflicts=(st)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd st
    make
}

package() {
    cd st
    make install
}

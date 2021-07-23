# Maintainer: Alexander Goussas <agoussas@espol.edu.ec>`
pkgname=st-aloussase-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="aloussase's build of suckless' Simple Terminal"
arch=('x86_64')
url="https://github.com/aloussase/st"
license=('MIT')
groups=()
depends=()
makedepends=("git" "harfbuzz")
checkdepends=()
optdepends=()
provides=("st")
conflicts=("st")
backup=()
options=()
install=
changelog=
source=('git+https://github.com/aloussase/st.git')
noextract=()
md5sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

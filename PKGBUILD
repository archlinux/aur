# Maintainer: Andrii Orap andrii.orap@student.uj.edu.pl
# Maintainer: Maksym Zub maksym.zub@gmail.com
# Maintainer: Nazarii Denha nazarii.denha@student.uj.edu.pl
# Maintainer: Tomasz Marzec tomasz4.marzec@student.uj.edu.pl
pkgname=graph-drawer
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Generate coordinates for graph visualisation"
arch=("x86_64")
url="https://gitlab.com/ia-projekt-zespolowy-2021-2022/graph-drawer"
license=('MIT')
groups=()
depends=('cmake')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/ia-projekt-zespolowy-2021-2022/graph-drawer/-/archive/main/graph-drawer-main.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
md5sums=('SKIP')
validpgpkeys=()

prepare() {
    mkdir $pkgname-$pkgver
    tar -xf $pkgname-$pkgver.tar.gz -C $pkgname-$pkgver --strip-components 1
}

build() {
	cd "$pkgname-$pkgver"
    cmake -B build
    cmake --build build
}

package() {
	cd "$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin/"
    cp build/drawer "$pkgdir/usr/bin/"
}

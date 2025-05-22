# Maintainer: Daniil T <contact.2imt@mail.ru>
pkgname="polycat"
pkgver="2.0.0"
pkgrel=1
epoch=
pkgdesc="Runcat module for Polybar"
arch=("x86_64")
url="https://github.com/2IMT/polycat.git"
license=("MIT")
groups=()
depends=("glibc" "gcc-libs")
makedepends=("make" "gcc")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/2IMT/polycat/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('767a20f1938535b91517ae12fd030eba')
validpgpkeys=()

build() {
    cd  $pkgname-$pkgver
    make POLYCAT_RELEASE=1 PREFIX=/usr
}

package() {
    cd $pkgname-$pkgver
    make install DEST_DIR=$pkgdir PREFIX=/usr
}

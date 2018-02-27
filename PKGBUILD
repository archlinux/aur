# Maintainer: Breizh <breizh@breizh.me>
pkgname=zest-writer
pkgver=1.8.0
pkgrel=3
pkgdesc="An offline editor for Zeste de Savoir"
arch=('i686' 'x86_64')
url="https://github.com/firm1/zest-writer"
license=('GPL3')
groups=()
depends=('gtk2' 'ffmpeg' 'libxslt')
makedepends=('jdk8-openjdk' 'java-openjfx')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/firm1/${pkgname}/archive/${pkgver}.tar.gz")
noextract=()
md5sums=('dbdb385746f5dd40a0e88ab469166c06')
validpgpkeys=()

build() {
        cd "$pkgname-$pkgver"
        ./gradlew assemble
}

package() {
        mkdir -p "$pkgdir/opt"
        mkdir -p "$pkgdir/usr/bin"
        cp -a "$pkgname-$pkgver/build/distributions/ZestWriter" "$pkgdir/opt/"
        ln -s "/opt/ZestWriter/ZestWriter" "$pkgdir/usr/bin/"
}

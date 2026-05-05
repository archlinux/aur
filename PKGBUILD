# Maintainer: Kyle Smith <kylesmith@dal.ca>
pkgname=libmapper
pkgver=2.5.2
pkgrel=1
pkgdesc="A library for connecting things."
arch=('x86_64')
url="http://libmapper.org/"
license=('LGPL-2.1-only')
groups=()
depends=('liblo>=0.34', 'zlib>=1.3', 'glibc>=2')
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
source=("https://github.com/libmapper/libmapper/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("aff1aa623eada922a428b730dacbe9523016600d1db9a9a53212833a6bd31ddc")
validpgpkeys=()

build() {
        cd "$pkgname-$pkgver"
        ./configure --prefix=/usr --disable-tests --disable-audio --disable-python --disable-java --disable-csharp
        make
}

check() {
        cd "$pkgname-$pkgver"
        make -k check
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
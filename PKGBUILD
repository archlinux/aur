# Maintainer: Anže Pintar <anze@anzepintar.com>

pkgname=anymeal
pkgver=1.33
pkgrel=1
pkgdesc="Recipe management software. Supports MealMaster recipes, import, export, search, display, edit, and printing them."
arch=('x86_64')
url="https://github.com/wedesoft/anymeal"
license=('GPL3')
depends=('sqlite' 'qt5-base')
makedepends=('autoconf' 'automake' 'libtool' 'flex' 'gtest' 'qt5-tools')
source=("$pkgname-$pkgver.tar.xz::https://github.com/wedesoft/anymeal/releases/download/v$pkgver/anymeal-$pkgver.tar.xz")
conflicts=("anymeal-git")
sha256sums=('75be857dc4ca0b673d0937775e2bb6267d5dc538880ba0cd38a092c2346f84df')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make clean
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

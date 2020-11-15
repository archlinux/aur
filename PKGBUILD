# Maintainer: Joel Snape <aur@sna.pe>
pkgname=rehex
pkgver=0.3.1
pkgrel=1
pkgdesc="A good general-purpose hex editor with a wide selection of features for analysing and annotating binary file formats"
arch=('x86_64')
url="https://github.com/solemnwarning/rehex"
license=('GPL')
depends=('jansson' 'wxgtk2')
makedepends=('capstone' 'jansson' 'wxgtk2' 'llvm')
options=()
install=
changelog=
source=($pkgname-$pkgver.zip::${url}/archive/${pkgver}.zip)
noextract=()
md5sums=('be4ae56a9b9cf0b3cd797aec8ffa5b82')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" prefix="/usr" install
}

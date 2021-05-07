# Maintainer: Joel Snape <aur@sna.pe>
pkgname=rehex
pkgver=0.3.91
pkgrel=2
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
sha256sums=(11eb02da3cd7b189b29a8df0449c69b4d0772630da6b117123e7b52b26813c1f)
build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" prefix="/usr" install
}

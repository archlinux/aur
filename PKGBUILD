# Maintainer: quik belov0507artem@gmail.com
# Contributor: quik belov0507artem@gmail.com

pkgname=ot
pkgver=0.0.1
pkgrel=1
pkgdesc="program to print text from folder"
arch=('x86_64')
url="https://codeberg.org/quik/just_programs"
license=('Unlicense')
depends=('gcc-libs')
makedepends=('gcc' 'make' 'unzip')
source=("$pkgname-$pkgver.zip::https://codeberg.org/quik/just_programs/archive/main:OutpuText.zip")
sha256sums=('e61df94e1729912df51afff4efb7ec91744bb0fcc72672864028897e49a6cf8c')

build() {
  cd "$srcdir/just_programs/"
  make MODE=release
}

package() {
  cd "$srcdir/just_programs/"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

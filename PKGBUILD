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
sha256sums=('dc222082a6712febae1ae040ef060fc536904583b2348687834ed2ca8a3cf3f5')

build() {
  cd "$srcdir/just_programs/"
  make MODE=release
}

package() {
  cd "$srcdir/just_programs/"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}

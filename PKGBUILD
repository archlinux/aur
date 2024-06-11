# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
# Maintainer: Zachary Lund <admin@computerquip.com>

pkgname=llnextgen
pkgver=0.5.5
pkgrel=3
pkgdesc="The spiritual successor of Jacobs and Grune's parser generator."
arch=(i686 x86_64)
url=https://os.ghalkes.nl/LLnextgen/download.html
license=(GPL-3.0-or-later)
depends=(glibc)
source=("http://os.ghalkes.nl/LLnextgen/releases/LLnextgen-$pkgver.tgz")
b2sums=('6d6f77b02ea1d6aa23dc3ffe49fb895ca20f339f938bdf332ac231e66c823078141bfa433349249da4a7daac8f656f008823e7db25d0cb1c791946d5ad26e426')

build() {
  cd "$srcdir/LLnextgen-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/LLnextgen-$pkgver"

  make prefix="$pkgdir/usr/" install
}

# Maintainer: korjjj
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Kaos < gianlucaatlas at gmail dot com >
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>

pkgname=ophcrack
pkgver=3.8.0
pkgrel=6
pkgdesc="Windows password cracker based on rainbow tables (no gui)"
arch=('x86_64')
url="https://gitlab.com/objectifsecurite/ophcrack"
license=('GPL')
source=(https://gitlab.com/objectifsecurite/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha512sums=('cb61d540f70f7dbac8253065d1cd0d77c827f11589645917a2992860bef60a506d2b0f98ea6533101e0be331b6eb2be03c36d276ab14284d7bc2c41e9ca856af')

build() {
  cd $pkgname-$pkgver
  autoreconf --install --force -W no-obsolete
  ./configure --disable-gui --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

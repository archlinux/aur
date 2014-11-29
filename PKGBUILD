# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=photorecover
pkgver=0.9.0
pkgrel=1
pkgdesc="Restore Jpeg/Exif/Jfif files from FAT filesystem"
arch=('i686' 'x86_64')
url="http://www.ee.oulu.fi/~iiska/projects/photorecover/"
license=('GPL')
source=(http://www.ee.oulu.fi/~iiska/projects/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('d1b25ddd5b06e20581ab84710275029c71f3b830f85d9d99177379b39b724b6b')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d "${pkgdir}"/usr/{bin,share/man/man1}
  make prefix="${pkgdir}"/usr install
}

# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ality@pbrane.org

pkgname=ranpwd
pkgver=1.1
pkgrel=3
pkgdesc="A tool to generate random passwords"
arch=('i686' 'x86_64')
url="http://www.kernel.org/pub/software/utils/admin/ranpwd"
license=('GPL')
source=(https://www.kernel.org/pub/software/utils/admin/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('94e376973b36071f2be661ae22f67e8c')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package () {
  cd "${srcdir}"/$pkgname-$pkgver

  make INSTALLROOT="${pkgdir}" install
}

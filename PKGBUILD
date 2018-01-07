# Maintainer: Jeremy MountainJohnson <jskier@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=srm
pkgver=1.2.15
pkgrel=2
pkgdesc="A secure replacement for rm(1) that overwrites data before unlinking"
arch=('x86_64')
url="http://srm.sourceforge.net/"
license=('custom')
depends=('glibc')
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('a8ec78473c55b70557fca88f525998ed51df3be58618b9da220e1bb73df013163f4e1563cbe2062b9cf1512152afeb9004b5be0be69cc1278c0d28597310dfd2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make prefix="${pkgdir}/usr" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/srm/LICENSE"
}

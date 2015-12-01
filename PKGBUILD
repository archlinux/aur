# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: Oliver Rümpelein <oli_r nospamat fg4f nospamdot de>

pkgname=chordii
pkgver=4.5.3
pkgrel=1
pkgdesc="Command line program for generating guitar chord music sheets from ChordPro text files"
arch=('i686' 'x86_64')
url="http://www.vromans.org/johan/projects/Chordii"
license=('GPL')
depends=(glibc)
source=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.gz")
md5sums=('499c07df0f49c4d89d6f88523d11e711')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/doc/${pkgname}/examples
  install -m644 examples/* "${pkgdir}"/usr/share/doc/${pkgname}/examples
}

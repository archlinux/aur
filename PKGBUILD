#
# PKGBUILD for bosh
#
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=bosh
pkgver=0.6
pkgrel=2
pkgdesc="Browsable Output SHell"
arch=('i686' 'x86_64')
url="http://bosh.sourceforge.net/"
license=('GPL2')
depends=('ncurses')
source=("http://sourceforge.net/projects/bosh/files/bosh/bosh%200.6/bosh-0.6.tar.gz/download")
md5sums=('975ef183ed4d2314186b1f2705d57c65')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

# EOF

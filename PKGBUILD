# Maintainer: CTech <ctech.exe@gmail.com>
# Contributor: George Eleftheriou <eleftg>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=sowing
pkgver=1.1.25
pkgrel=1
pkgdesc="Tools for documenting and improving portability"
arch=('any')
url="http://www.cs.uiuc.edu/~wgropp/projects/software/sowing"
license=('GPL')
source=($pkgname-$pkgver.tar.gz::http://wgropp.cs.illinois.edu/projects/software/sowing/sowing.tar.gz)
sha256sums=('217f3035da230f32862368e9447e84ff210c6670567631da557408a069982bf3')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --datadir=/usr/share/sowing

  # force -j1 otherwise compilation problems may occur
  # depending on the timing of the jobs
  make -j1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install prefix="${pkgdir}/usr" datadir="${pkgdir}/usr/share/sowing"
}

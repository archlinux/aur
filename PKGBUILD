# Maintainer: George Eleftheriou <eleftg>
# Contributor: Jed Brown <jed@59A2.org>

pkgname=sowing
pkgver=1.1.18
pkgrel=2
pkgdesc="Tools for documenting and improving portability"
arch=('any')
url="http://www.cs.uiuc.edu/~wgropp/projects/software/sowing"
license=('GPL')
source=('http://ftp.mcs.anl.gov/pub/sowing/sowing.tar.gz')
sha256sums=('b63cec263c413b18d283d8885ff38fe0c2267d8fc6b2246b8df922411cab1e13')

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

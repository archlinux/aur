# Maintainer: Nicolas Cornu <nicolac76@yahoo.fr>

pkgname=darshan-util
pkgver='3.4.2'
pkgrel='1'
pkgdesc="HPC I/O Characterization Tool"
arch=(any)
url="https://www.mcs.anl.gov/research/projects/darshan"
source=("ftp://ftp.mcs.anl.gov/pub/darshan/releases/darshan-${pkgver}.tar.gz")
sha512sums=('ff659e1350183719db14ab6deb12dc03eac950fbc0c8753ebd3887fdc271cf35184508243b80f93583504d04812615189ea80ecfcdec82269f3215f41cecce78')

build() {
  cd darshan-${pkgver}
  ./prepare.sh
  cd darshan-util
  ./configure --prefix="/usr"
  make
}

package() {
  cd darshan-${pkgver}/darshan-util
  make install DESTDIR="${pkgdir}"
}

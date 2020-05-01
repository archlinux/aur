# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=arch
pkgver=1.3.5
pkgrel=12
pkgdesc='A modern and remarkable revision control system.'
arch=('x86_64')
license=('GPL')
url='https://www.gnu.org/software/gnu-arch'
depends=('zlib' 'expat' 'krb5')
options=('!makeflags')
source=("https://ftp.gnu.org/old-gnu/gnu-arch/tla-${pkgver}.tar.gz")
md5sums=('db31ee89bc4788eef1eba1cee6c176ef')

build() {
  cd "${srcdir}/tla-${pkgver}"

  mkdir build
  cd build
  ../src/configure --prefix /usr
  make
}

package() {
  cd "${srcdir}/tla-${pkgver}/build"
  make prefix="${pkgdir}/usr" install
}

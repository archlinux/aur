# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=mkpwd
pkgver=1.6
pkgrel=3
pkgdesc="Command line password generator"
arch=('i686' 'x86_64')
url="https://www.o-schroeder.de/projects/mkpwd"
license=('GPL3')
source=("https://www.o-schroeder.de/download/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('6db5032fa6e2bc3ebd499ebf2b94f8df5b3ce64760d84fda7101e951bfb5c88a')

build() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"

  install -m644 AUTHORS ChangeLog README \
    "${pkgdir}/usr/share/doc/${pkgname}"
}

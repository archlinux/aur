# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('7482 31EB CBD8 08A1 4F5E  85D2 8C00 4C2F 9348 1F6B')
# Contributor:	Gergely	Tamas	<mfa.kfki.hu: dice>
# Past maintainer:	Jesse	Jaara	<gmail.com: jesse.jaara>

pkgname=mbr
pkgver=1.1.11
pkgrel=5
pkgdesc="A replacement master boot record"
url="http://www.chiark.greenend.org.uk/~neilt/mbr/"
license=("GPL")
makedepends=('bin86')
arch=('i686' 'x86_64')
source=(http://www.chiark.greenend.org.uk/~neilt/mbr/${pkgname}-${pkgver}.tar.gz)
sha512sums=('27637b7c37be22ec7947b73684156a38c76dd1d37fad12133dd614ac4b98b578b30a758e6179a7cd62f6044dde2dce19a1e28234aa4bd0d848ef97b44d6cd8f9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sbindir=/usr/bin

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}


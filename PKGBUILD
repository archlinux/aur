# Contributor:	Gergely	Tamas	<mfa.kfki.hu: dice>
# Maintainer:	Jesse	Jaara	<gmail.com: jesse.jaara>

pkgname=mbr
pkgver=1.1.11
pkgrel=2
pkgdesc="A replacement master boot record"
url="http://www.chiark.greenend.org.uk/~neilt/mbr/"
license="GPL"
makedepends=('bin86')
arch=('i686' 'x86_64')
source=(http://www.chiark.greenend.org.uk/~neilt/mbr/$pkgname-$pkgver.tar.gz)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sbindir=/usr/bin

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

md5sums=('4e406ded185f94c2d2bf5fc793ac1842')

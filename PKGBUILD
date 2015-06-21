# Maintainer: Olivier LM <mail at olivierlemoal dot fr>
# Contributor: Pascal E. <archlinux at hardfalcon dot net>
# Contributor: Andrej Gelenberg <andrej.gelenberg at udo dot edu>
pkgname=mfoc
pkgver=0.10.7
pkgrel=2
pkgdesc="Mifare Classic Offline Cracker"
arch=('i686' 'x86_64')
url="https://github.com/nfc-tools/mfoc"
license=('GPL2')
depends=("libnfc>=1.7.0")
source=("https://github.com/nfc-tools/mfoc/archive/$pkgname-$pkgver.tar.gz")

sha1sums=('4df9fee7a1cbbc5b25b4a5db53a192325b132805')

package()
{
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

build()
{
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  autoreconf -vis
  ./configure --prefix=/usr
  make 
}

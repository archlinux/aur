# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=erfa
pkgver=1.2.0
pkgrel=1
pkgdesc="Set of algorithms and procedures used in fundamental astronomy"
url="https://github.com/liberfa/erfa"
arch=('x86_64' 'i686')
license=('BSD')
options=('!libtool')
source=("https://github.com/liberfa/erfa/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('63e8e694d53add33c16f3f494d2b65f4')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
#  make CFLAGF="-c -O -fPIC"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

 install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="${pkgdir}/" install
}

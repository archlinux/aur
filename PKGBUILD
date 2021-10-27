# Maintainer: kevku <kevku@gmx.com>
pkgname='xml-security-c'
pkgver='2.0.3'
pkgrel='1'
pkgdesc='C++ Implementation of W3C security standards for XML'
arch=('i686' 'x86_64')
url='http://santuario.apache.org/'
license=('Apache')
depends=('xerces-c' 'xalan-c')
source=("https://dlcdn.apache.org/santuario/c-library/$pkgname-$pkgver.tar.bz2.asc"
        "https://dlcdn.apache.org/santuario/c-library/$pkgname-$pkgver.tar.bz2")
sha256sums=('SKIP'
            '803029f129005a9b453aa45f0b3e44c28b8f2ec5eb526c20c74f93995cf6da69')
validpgpkeys=('DCAA15007BED9DE690CD9523378B845402277962')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
    --without-nss \
    --with-openssl=/usr \
    --disable-debug \
    --disable-static
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

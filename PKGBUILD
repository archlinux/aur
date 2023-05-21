# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
pkgver=20230322
pkgrel=4
pkgdesc="ASN.1 analyze tool"
url="http://www.cs.auckland.ac.nz/~pgut001"
license=('custom')
source=(dumpasn1-$pkgver.c::'https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c'
        dumpasn1-$pkgver.cfg::'https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg'
        'LICENSE')
sha256sums=('8ce8fdbf2e9b11d410b0ab4e44a6b3f89c27080113f051ec1054d230e050a0b8'
            'ed1eaafb0ad865b97738dfe0b0e5d602c76dc0cde4c0cee4cdcdd11c28f480e5'
            'f58dfb06633792773b4e539666f0fac52eb44acf29619175d073b146e22785e4')

arch=('i686' 'x86_64')
depends=(glibc)

build() {
  cd "${srcdir}"
  gcc $CPPFLAGS $CFLAGS $LDFLAGS -o dumpasn1 dumpasn1-$pkgver.c
}

package(){
  install -D -m755 "${srcdir}/dumpasn1" "${pkgdir}/usr/bin/dumpasn1"
  install -D -m644 "${srcdir}/dumpasn1-$pkgver.cfg" "${pkgdir}/etc/dumpasn1/dumpasn1.cfg"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

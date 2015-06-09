# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
pkgver=20141219
pkgrel=1
pkgdesc="ASN.1 analyze tool"
url="http://www.cs.auckland.ac.nz/~pgut001"
license=('custom')
source=('http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c'
        'http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg'
        'LICENSE')
sha256sums=('d0d77c951a0471c88f14db6d3f6ca32f6492954f4b1c7d2aedbf4fe97905b32c'
            '0940792d7e83c6229a5b9bdda89c19b01e9b9962c81f2cd8845ca54b34ea2457'
            'f58dfb06633792773b4e539666f0fac52eb44acf29619175d073b146e22785e4')

arch=('i686' 'x86_64')
depends=()

build() {
  cd "${srcdir}"
  gcc -o dumpasn1 dumpasn1.c
}

package(){
  install -D -m755 "${srcdir}/dumpasn1" "${pkgdir}/usr/bin/dumpasn1"
  install -D -m644 "${srcdir}/dumpasn1.cfg" "${pkgdir}/etc/dumpasn1/dumpasn1.cfg"
  install -D -m644 "${srcdir}/../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

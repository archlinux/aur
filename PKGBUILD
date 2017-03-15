# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
pkgver=20170307
pkgrel=1
pkgdesc="ASN.1 analyze tool"
url="http://www.cs.auckland.ac.nz/~pgut001"
license=('custom')
source=('http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c'
        'http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg'
        'LICENSE')
sha256sums=('f2c0b07c1540c1013df49261c0b707a1452ddd0711d195efb4ce26e3f86e2181'
            '9774ecae122c2e4e68d97489c46871081e04e746c85135288c4a77d04a0544f7'
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
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

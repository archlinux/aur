# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
pkgver=20180709
pkgrel=1
pkgdesc="ASN.1 analyze tool"
url="http://www.cs.auckland.ac.nz/~pgut001"
license=('custom')
source=('http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c'
        'http://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg'
        'LICENSE')
sha256sums=('d42b7fb8457b9282ee341429baaaaf0ef7b2310cb28fcf2fc41914e07e8b1370'
            '94245ed185e2bdb94b00ba031bb67ab83980748626f532ee4565df886468f196'
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

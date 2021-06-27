# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
pkgver=20210212
pkgrel=1
pkgdesc="ASN.1 analyze tool"
url="http://www.cs.auckland.ac.nz/~pgut001"
license=('custom')
source=('https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c'
        'https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg'
        'LICENSE')
sha256sums=('319a85af8d75f95f16ecb6fd8a9b59aef22a0e3798e84c830027d1bead9adaeb'
            '1d02cfea8fa556281aed3911f96db517a50017eaaaded562fe6683d008bd1fac'
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

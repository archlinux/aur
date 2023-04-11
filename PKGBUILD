# Maintainer: Emanuel Duss <emanuel.duss@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>
pkgname=dumpasn1
pkgver=20220916
pkgrel=1
pkgdesc="ASN.1 analyze tool"
url="http://www.cs.auckland.ac.nz/~pgut001"
license=('custom')
source=('https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.c'
        'https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg'
        'LICENSE')
sha256sums=('8ce8fdbf2e9b11d410b0ab4e44a6b3f89c27080113f051ec1054d230e050a0b8'
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

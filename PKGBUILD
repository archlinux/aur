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
            '6e3942e1f61f309358837c4b69972b80267e3fe881b1c1f064425bbb145a5c74'
            'cae4ec2cca1d22e7ac0e95d87d9e806e1e2629eb226147a050312b450e8daab6')

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

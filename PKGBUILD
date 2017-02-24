# Maintainer: kaptoxic
# Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor: Antonio Bonifati <antonio punto bonifati a google>
# Contributor(s): ECRC GmbH\
# Contributor(s): IC-Parc, Imperial College London

_major_version=6.1
_minor_version=225

pkgname=eclipse-clp
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="Constraint Logic Programming System"
arch=('i686' 'x86_64')
url="http://eclipseclp.org/"
license=('CMPL 1.1')
depends=('tk')
optdepends=('java-runtime: jvm support')

install=eclipse-clp.install

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='x86_64'
elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
fi


source_i686=("http://eclipseclp.org/Distribution/${_major_version}_${_minor_version}/${ARCH}_linux/eclipse_basic.tgz")
source_x86_64=("http://eclipseclp.org/Distribution/${_major_version}_${_minor_version}/${ARCH}_linux/eclipse_basic.tgz")

md5sums_i686=('6c8a01d8d41396ebf9b08dcffcf86a9d')
md5sums_x86_64=('a803c6eac558de07f65e5c00b3562687')

package() {
  cd ${srcdir}

  rm eclipse_basic.tgz

  targetDir=${pkgdir}/opt/eclipse-clp

  mkdir -p ${targetDir}

  cp -dR ./* ${targetDir}
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/eclipse-clp/bin/${ARCH}_linux/eclipse" "${pkgdir}/usr/bin/eclipse-clp"
  ln -s "/opt/eclipse-clp/bin/${ARCH}_linux/jeclipse" "${pkgdir}/usr/bin/jeclipse-clp"
  ln -s "/opt/eclipse-clp/bin/${ARCH}_linux/tkeclipse" "${pkgdir}/usr/bin/tkeclipse-clp"
}

# Maintainer: kaptoxic
# Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor: Antonio Bonifati <antonio punto bonifati a google>
# Contributor(s): ECRC GmbH\
# Contributor(s): IC-Parc, Imperial College London

_major_version=6.1
_minor_version=228

pkgname=eclipse-clp
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="Constraint Logic Programming System"
arch=('i686' 'x86_64')
url="http://eclipseclp.org/"
license=('CMPL 1.1')
depends=('tk')
optdepends=('java-runtime: jvm support'
            'rlwrap: readline support')

install=eclipse-clp.install



source_i686=("http://eclipseclp.org/Distribution/${_major_version}_${_minor_version}/i386_linux/eclipse_basic.tgz")
source_x86_64=("http://eclipseclp.org/Distribution/${_major_version}_${_minor_version}/x86_64_linux/eclipse_basic.tgz")

md5sums_i686=('9e1670ee04e25ade623f25f48f1048c9')
md5sums_x86_64=('4463889656ea510792c9d693a1fb9503')

package() {
  cd ${srcdir}

  rm eclipse_basic.tgz

  targetDir=${pkgdir}/opt/eclipse-clp

  mkdir -p ${targetDir}

  cp -dR ./* ${targetDir}
  mkdir -p "${pkgdir}/usr/bin"

  if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='x86_64'
  elif [ "${CARCH}" = 'i686' ]; then
    ARCH='i386'
  fi
  ln -s "/opt/eclipse-clp/bin/${ARCH}_linux/eclipse" "${pkgdir}/usr/bin/eclipse-clp"
  ln -s "/opt/eclipse-clp/bin/${ARCH}_linux/jeclipse" "${pkgdir}/usr/bin/jeclipse-clp"
  ln -s "/opt/eclipse-clp/bin/${ARCH}_linux/tkeclipse" "${pkgdir}/usr/bin/tkeclipse-clp"
}

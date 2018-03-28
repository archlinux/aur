# Maintainer: kaptoxic
# Maintainer: DenBrahe <denbrahe at hotmail dot com>
# Contributor: Antonio Bonifati <antonio punto bonifati a google>
# Contributor(s): ECRC GmbH\
# Contributor(s): IC-Parc, Imperial College London

_major_version=7.0
_minor_version=41

pkgname=eclipse-clp
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="Constraint Logic Programming System"
arch=('x86_64')
url="http://eclipseclp.org/"
license=('CMPL 1.1')
depends=('tk')
optdepends=('java-runtime: jvm support'
            'rlwrap: readline support')

install=eclipse-clp.install



source_x86_64=("http://eclipseclp.org/Distribution/Builds/${_major_version}_${_minor_version}/x86_64_linux/eclipse_basic.tgz")

md5sums_x86_64=('4e66d73ec12b12cbac1cab8d248a3716')

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

# Maintainer: kaptoxic
# Contributor: Antonio Bonifati <antonio punto bonifati a google>
# Contributor(s): ECRC GmbH\
# Contributor(s): IC-Parc, Imperial College London

_major_version=6.1
_minor_version=220

pkgname=eclipse-clp
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="Constraint Logic Programming System"
arch=('i686' 'x86_64')
url="http://eclipseclp.org/"
license=('CMPL 1.1')
depends=('tk')

install=eclipse-clp.install

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='x86_64'
  MD5SUM='b78e2cd2263e5cce9991e6a66922b9fd'
elif [ "${CARCH}" = 'i686' ]; then
  ARCH='i386'
  MD5SUM='8935e236e0071f7bc283c84bffcb2b99'
fi

source=("http://eclipseclp.org/Distribution/${_major_version}_${_minor_version}/${ARCH}_linux/eclipse_basic.tgz"
	'eclipse-clp.sh')

md5sums=('7421c81daa18a6d38275e632e6de31f8'
         '46d4d43af0d59ecec2401706714dad8f')

package() {
  cd ${srcdir}

  # remove this symlink created by makepkg...
  rm eclipse_basic.tgz

  targetDir=${pkgdir}/opt/eclipse-clp

  mkdir -p ${targetDir}

  cp -dR * ${targetDir}

  install -Dm755 eclipse-clp.sh  ${pkgdir}/etc/profile.d/eclipse-clp.sh
}

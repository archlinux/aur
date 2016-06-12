# Maintainer: Antonio Bonifati <antonio punto bonifati a google>
# Contributor(s): ECRC GmbH\
# Contributor(s): IC-Parc, Imperial College London
pkgname=eclipse-clp
pkgver=6.1.194
pkgrel=2
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

source=("http://eclipseclp.org/Distribution/6.1_194/${ARCH}_linux/eclipse_basic.tgz"
	'eclipse-clp.sh')

md5sums=($MD5SUM '46d4d43af0d59ecec2401706714dad8f')

package() {
  cd ${srcdir}

  # remove this symlink created by makepkg...
  rm eclipse_basic.tgz

  targetDir=${pkgdir}/opt/eclipse-clp

  mkdir -p ${targetDir}

  cp -dR * ${targetDir}

  install -Dm755 eclipse-clp.sh  ${pkgdir}/etc/profile.d/eclipse-clp.sh
}

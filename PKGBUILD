# Maintainer: DenBrahe <denbrahe at hotmail dot com>

_major_version=3.6
_minor_version=0

pkgname=idp
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="Knowledge Base System"
arch=('i686' 'x86_64')
url="http://dtai.cs.kuleuven.be/software/idp"
license=('LGPL3')


source=("https://dtai.cs.kuleuven.be/krr/files/releases/idp/${_major_version}.${_minor_version}/idp-${_major_version}.${_minor_version}-Linux.tar.gz")

md5sums=('6d521d83bf5b7516c00f34c7e5f369bd')

package() {
  cd ${srcdir}

  rm idp-${_major_version}.${_minor_version}-Linux.tar.gz

  targetDir=${pkgdir}/opt/idp

  mkdir -p ${targetDir}

  cp -dR ./idp-${_major_version}.${_minor_version}-Linux/* ${targetDir}/
  mkdir -p "${pkgdir}/usr/bin"

  ln -s "/opt/idp/bin/idp" "${pkgdir}/usr/bin/idp"
}

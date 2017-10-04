# Maintainer: DenBrahe <denbrahe at hotmail dot com>

_major_version=1.1
_minor_version=1

pkgname=idp-ide
pkgver=${_major_version}.${_minor_version}
pkgrel=1
pkgdesc="IDP Knowledge Base System editor"
arch=('i686' 'x86_64')
url="http://dtai.cs.kuleuven.be/software/idp"
license=('LGPL3')
depends=('idp')


source=("https://downloads.sourceforge.net/project/idp/idp-ide/idp-ide-${_major_version}.${_minor_version}-Linux.tar.gz")


md5sums=('cba00affb753128d613099c1a93b074c')

package() {
  cd ${srcdir}

  rm idp-ide-${_major_version}.${_minor_version}-Linux.tar.gz

  targetDir=${pkgdir}/opt/idp-ide

  mkdir -p ${targetDir}

  cp -dR ./* ${targetDir}/
  mkdir -p "${pkgdir}/usr/bin"

  #ln -s "/opt/idp-ide/webID" "${pkgdir}/usr/bin/idp-ide"
  echo 'sh -c "cd /opt/idp-ide && ./webID"' > "${pkgdir}/usr/bin/idp-ide"
  chmod +x "${pkgdir}/usr/bin/idp-ide"

  touch "${targetDir}/log/access.log"
  touch "${targetDir}/log/error.log"
  chmod -R 777 "${targetDir}/log"
}

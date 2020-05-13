# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.10.12
pkgrel=1
x64_rel=1
i386_rel=1
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("d3666a516a6bdd01f441b3faa7e8d3ab422f73cae4f307d96d141431c96a8347")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.10/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("ae432ded70db9710081e06bd1bf7c8fa40fa3a20bb3d36fccf395e96c0161c84")
  _carch=_i686
  source=("http://download.nomachine.com/download/6.10/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


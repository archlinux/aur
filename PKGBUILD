# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=5.1.62
pkgrel=1
x64_rel=1
i386_rel=1
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('a813ccf6ef22991d91675a59242f023a4456402e631fcbaabb1260d308d26ed4')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('93e6935a7154a7dff42eeb96a051e83d3b0e63cdfd35f0dbb5b1387596571298')
  _carch=_i686
  source=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


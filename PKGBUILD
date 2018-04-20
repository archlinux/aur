# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.1.6
pkgrel=9
x64_rel=9
i386_rel=10
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('bffb6d012c2002fe63c8bba265a20cdbde5c387188a8a6785dea28aaaa2434ea')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.1/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('c6fd85e4342a3c31bda0d68eb7ad6c5fce6bfa98c2edd19795493debb9ad7e96')
  _carch=_i686
  source=("http://download.nomachine.com/download/6.1/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


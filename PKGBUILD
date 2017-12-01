# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.0.66
pkgrel=2
x64_rel=2
i386_rel=2
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('3f5c6ecfc2a3038bfcdebefcca50d43cf7ded9bbfd09fa57ed342cf2e58fbbb4')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('3b2810c247bc5fbe04eddb2768ec949046fd505387600c8033fc3f8f103ea79b')
  _carch=_i686
  source=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


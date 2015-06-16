# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=4.6.4
pkgrel=1
x64_rel=14
i386_rel=17
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('e3149a4a0a6ba9f6e29458d589345873e0c22998a3c84af4e90e7435f53926b7')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('b251fe7cd8662b64178e32624e58e41bb4e71acfec3e8d2d2419a6c54cb39174')
  _carch=_i686
  source=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


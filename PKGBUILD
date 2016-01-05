# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=5.0.58
pkgrel=3
x64_rel=3
i386_rel=3
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('ef1feb35869e5fc24e8c9108fa044a5ebf205a9218d057db4ead138a050aee47')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('fe9fc24e0c9ad20b1214cbabcfff18ba302da3484378bb99f6b8ea8e9e1d3df0')
  _carch=_i686
  source=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


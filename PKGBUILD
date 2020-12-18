# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.0.208
pkgrel=7
x64_rel=7
i386_rel=6
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("a6aa8d10c85de2c659a10dd729441678f1627786f63a34c0bb2a2d37354742ef")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/7.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("e31ba797d1a5ffa74b21787efab3d54550b16488b2fee52856437201e9eef6a4")
  _carch=_i686
  source=("http://download.nomachine.com/download/7.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


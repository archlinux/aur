# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=5.2.21
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
  sha256sums=('2af65229a8667289c3d097c5fba941175424d5350f79ff156b912ecf05362d5a')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('22e84483609327b347339a142625f537ce4d4e5afc7012c6900399762fc86623')
  _carch=_i686
  source=("http://download.nomachine.com/download/5.2/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.7.6
pkgrel=13
x64_rel=13
i386_rel=11
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("28b81333177ffa96cc3fa4380c45fed3799f1d56f18d4c9933a245ea77b97a64")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.7/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("855873521c181656e78708d9efb95ae0a5252c92985aba4270b5b6df0b0a1425")
  _carch=_i686
  source=("http://download.nomachine.com/download/6.7/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.0.211
pkgrel=4
x64_rel=4
i386_rel=4
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2020 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("a53958df8ab67043aca9575f67038b6a964b228127704f80172a7dae45fed05b")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/7.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("83db84f1d66140773d19ac7f36ca2cacea91e42ed9452ddfd86cab4a78580854")
  _carch=_i686
  source=("http://download.nomachine.com/download/7.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


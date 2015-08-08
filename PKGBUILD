# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=4.6.12
pkgrel=14
x64_rel=7
i386_rel=14
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('2dc1ad80a2ad829346009ad4f8aa9d3d3b097b70d8f929100fb79e01fcb4b403')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('5351a189cdab46a3d3f00e9b7a4802c64099afe17d12cd915ef41149e83dabbd')
  _carch=_i686
  source=("http://download.nomachine.com/download/4.6/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


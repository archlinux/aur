# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=5.1.9
pkgrel=6
x64_rel=6
i386_rel=7
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('80bea727d9f7b742788da21ca9e1f50f35c132657e8017eb1591d696aa6e76e0')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('8b7b528a17c049e6e275657daf2b67aa2e8c0563a15904233d3844e7a91346db')
  _carch=_i686
  source=("http://download.nomachine.com/download/5.1/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


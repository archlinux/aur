# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=5.0.63
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
  sha256sums=('c91965df38ae370142b17bdcd73fae87e88d88e5310e7dea3c89006cb8fa1938')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('02566c89c4af790f93ea8b19598948b5fa2cd99a88fa1f5980bb3b968ebc1b83')
  _carch=_i686
  source=("http://download.nomachine.com/download/5.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


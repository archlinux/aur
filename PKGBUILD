# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=5.3.9
pkgrel=6
x64_rel=6
i386_rel=5
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('6853a1181a89f9b2afe4ccd36d8aad5b86f5c289c842d317cc2ec8c6bc34f20a')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('4f514f9a15eaf1c97849af6fb6254b5caa591c155e4a4262867f23b46108a5ce')
  _carch=_i686
  source=("http://download.nomachine.com/download/5.3/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


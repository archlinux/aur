# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.4.6
pkgrel=1
x64_rel=1
i386_rel=1
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("118598166adf45cceb70ba6edfb51581753d693aa11d6487f8b146e091ba7b4e")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.4/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("b5dedea7c5fdf411782a207a08ad86c169454d3e2030a12c0cb750e43a1e7a48")
  _carch=_i686
  source=("http://download.nomachine.com/download/6.4/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


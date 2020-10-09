# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.12.3
pkgrel=8
x64_rel=7
i386_rel=8
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("72f4a68da4663bc3a95d7a2804cdc2c8243dffd69b74ff4820082c63cbd0031f")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.12/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("1dc4df7cdcd9586186f74aa5a65f6623b5b4c8c461a1b5a32523b6ffd0e89e2d")
  _carch=_i686
  source=("http://download.nomachine.com/download/6.12/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


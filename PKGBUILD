# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.4.1
pkgrel=1
x64_rel=1
i386_rel=1
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2020 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("ecfc67141c56cdaf8831583c1883254c925b6bdfdfee79065f4c4e6dc4d8254e")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/7.4/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("ca0ea984ff7c5f969c5a3d695105c1e492df5b10761bb70337f7773fb606b836")
  _carch=_i686
  source=("http://download.nomachine.com/download/7.4/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


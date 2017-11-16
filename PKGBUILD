# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.0.62
pkgrel=6
x64_rel=6
i386_rel=6
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=('nomachine nxmanager nxwebplayer nxserver nxnode nxclient')
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=('8b721fdb757f697fd04411a77fce8f9b380653780697ebaed02c19884408ffd4')
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=('ca8ec4f697790c5905a582c85773f9c28672a27ca103cfc7053e7799e685084c')
  _carch=_i686
  source=("http://download.nomachine.com/download/6.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


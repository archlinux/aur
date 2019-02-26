# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.5.6
pkgrel=9
x64_rel=9
i386_rel=9
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("f3074c105d0a2e268742f548fe916de2cdff04f2fb324982aee74a7c2d5c7040")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.5/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("e828a704fcc307a3b10391dd164c3989a6ae5304f3e76f6985cd13d2bdd4408c")
  _carch=_i686
  source=("http://download.nomachine.com/download/6.5/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


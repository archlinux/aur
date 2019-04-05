# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=6.6.8
pkgrel=5
x64_rel=5
i386_rel=5
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2015 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("8272dc80613d3e7bc081b959fa8217472cd307b69ad0d371e443419b14c4ed17")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/6.6/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("50f789a7d1f6982bd6e3904ee979345f6f4f90bc7372df2b5419924a153ee248")
  _carch=_i686
  source=("http://download.nomachine.com/download/6.6/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


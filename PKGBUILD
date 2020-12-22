# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.0.209
pkgrel=10
x64_rel=10
i386_rel=6
pkgdesc="Remote desktop application"
url="http://www.nomachine.com"
license=('custom:"Copyright 2002-2020 NoMachine S.a r.l."')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install

if [ "${CARCH}" = "x86_64" ]; then
  sha256sums=("401f8b4d241a18a2ef33897c5988342830e831f57ba51ccc73eee63ed3c3cf3d")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/7.0/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("d720ccff7292a0adc902f63faa5e30ec8a240c2d990895de81b869ec5ad997f7")
  _carch=_i686
  source=("http://download.nomachine.com/download/7.0/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


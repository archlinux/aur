# Maintainer: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.1.3
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
  sha256sums=("a195182dfa1f6e945cdf15758cd6a1707bbf0cdc88b71db7568f2f4b8f85c818")
  _carch=_x86_64
  source=("http://download.nomachine.com/download/7.1/Linux/${pkgname}_${pkgver}_${x64_rel}${_carch}.tar.gz")
elif [ "${CARCH}" = "i686" ]; then
  sha256sums=("b26f91b86196803879892e4f221b44c849d4e5b5ee8f2e84b4981d76c9659477")
  _carch=_i686
  source=("http://download.nomachine.com/download/7.1/Linux/${pkgname}_${pkgver}_${i386_rel}${_carch}.tar.gz")
fi

package()
{
  cd "${srcdir}"
  install -d "${pkgdir}/usr/"
  cp -a NX "${pkgdir}/usr/NX"
}


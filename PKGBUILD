# Maintainer: malet
pkgname=nusmv-bin
_pkgname=NuSMV
pkgver=2.6.0
pkgrel=1
pkgdesc="A new symbolic model checker"
arch=('x86_64')
url="http://nusmv.fbk.eu/index.html"
license=('LGPL2.1')
provides=('nusmv')
conflicts=('nusmv')
source=(${pkgname}-${pkgver}.tar.gz::http://nusmv.fbk.eu/distrib/${_pkgname}-${pkgver}-linux64.tar.gz)
sha256sums=('11b12e42bc04566c4ec1f7cc205fa8704382ac4d69e052154cbb59c9b7e8e08c')

package() {
  cd ${_pkgname}-${pkgver}-Linux

  # Creating directories
  install -dm755 $pkgdir/opt/nusmv
  install -dm755 $pkgdir/usr/bin

  # Install binaries
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-Linux/bin/NuSMV" "${pkgdir}"/opt/nusmv/bin/NuSMV
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}-Linux/bin/ltl2smv" "${pkgdir}"/opt/nusmv/bin/ltl2smv
  # Copy dependencies
  cp -r "${srcdir}/${_pkgname}-${pkgver}-Linux/"* "${pkgdir}"/opt/nusmv/
  ln -s /opt/nusmv/bin/NuSMV "${pkgdir}"/usr/bin/NuSMV
  ln -s /opt/nusmv/bin/ltl2smv "${pkgdir}"/usr/bin/ltl2smv
}

# Maintainer: Nicola Squartini <tensor5@gmail.com>
pkgname=systemsim-cell
pkgver=3.1
pkgrel=1
pkgdesc="IBM Full-System Simulator for the Cell Broadband Engine Processor"
arch=(x86_64)
url="http://www.ibm.com/"
license="IBM Licensed Materials"
groups=('Cell Simulator')
depends=(gcc-libs perl tk)
makedepends=(rpmextract)
options=(!strip)
source=(http://git.gitbrew.org/openclit/packages/CELL_EMULATOR/systemsim-cell-3.1-25.f9.x86_64.rpm
        99-systemsim-cell.rules
        systemsim-cell.sh)
noextract=(systemsim-cell-3.1-25.f9.x86_64.rpm)
md5sums=('4b069cebf26bd16cec8e768d2c68e830'
         'e470b6ef7d042cfe4ade6180b5c45cb8'
         'bf46bc7b66e0aa4f3c8894a49bdbade8')

package() {
  mkdir -p "${pkgdir}"
  cd "${pkgdir}"
  rpmextract.sh "${srcdir}/systemsim-cell-3.1-25.f9.x86_64.rpm"

  chmod 4755 "${pkgdir}/opt/ibm/systemsim-cell/bin/snif"

  mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
  cp "${srcdir}/99-systemsim-cell.rules" "${pkgdir}/usr/lib/udev/rules.d"

  mkdir -p "${pkgdir}/etc/profile.d"
  cp "${srcdir}/systemsim-cell.sh" "${pkgdir}/etc/profile.d"
}

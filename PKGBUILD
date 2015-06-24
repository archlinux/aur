# Maintainer: Musikolo <musikolo {at} hotmail [dot] com>

packager=('Musikolo')
_original_pkgname=eyasdp
pkgname=kdeplasma-applets-${_original_pkgname}
pkgver=1.2.0
pkgdesc="Enhanced yaSDP(yet another ShutDown plasmoid)"
pkgrel=2
arch=(i686 x86_64)
url="http://kde-look.org/content/show.php?content=146530"
license=(GPL3)
groups=('kde' 'plasmoid')
makedepends=(cmake automoc4)
depends=(kdebase-workspace)
options=()
conflicts=(eyasdp kdeplasma-addons-applets-eyasdp)
replaces=(kdeplasma-addons-applets-eyasdp)
source=(http://kde-look.org/CONTENT/content-files/146530-${_original_pkgname}-${pkgver}.tar.bz2)
sha256sums=('50c250c27150aaa3ac70d20e776754f983f201fbe5017c59634697d05a29d522')

package() {
  cd "${_original_pkgname}-${pkgver}"
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
  make DESTDIR=${pkgdir} install

  _licenses_dir="${pkgdir}`kde4-config --prefix`/share/licenses/${pkgname}"
  install -D AUTHORS ${_licenses_dir}/AUTHORS
  install -D ChangeLog ${_licenses_dir}/ChangeLog
  install -D COPYING ${_licenses_dir}/COPYING
  install -D TODO ${_licenses_dir}/TODO
}

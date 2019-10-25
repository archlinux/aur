# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=fofimon
pkgver=0.6
pkgrel=1
pkgdesc="Monitor selected folders and files for modifications"
url='https://www.efanomars.com/utilities/fofimon'
arch=('x86_64')
license=('GPL3')

depends=('glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("fofimon")
#replaces=("fofimon")
#conflicts=("fofimon")

source=('https://efanomars.com/sources/fofimon-0.6.tar.gz')
sha256sums=('855a5b13d0a855ba0925ecaf76fe0b71cd2a83aecbab828e97eeb27bef77a192')

build() {
  cd "${srcdir}/fofimon"

  ./scripts/install_fofimon.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/fofimon"

  ./scripts/priv/dd_install_fofimon.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

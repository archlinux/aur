# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=fofimon
pkgver=0.10
pkgrel=1
pkgdesc="Monitor selected folders and files for modifications"
url='https://efanomars.com/utilities/fofimon'
arch=('x86_64')
license=('GPL3')

depends=('glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("fofimon")
#replaces=("fofimon")
#conflicts=("fofimon")

source=('https://efanomars.com/sources/fofimon-0.10.tar.gz')
sha256sums=('8b3f00a5e7982f3ee81216cbd2aff37092dd7a2d4aea9958be9e13d69193463d')

build() {
  cd "${srcdir}/fofimon"

  ./scripts/install_fofimon.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/fofimon"

  ./scripts/priv/dd_install_fofimon.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

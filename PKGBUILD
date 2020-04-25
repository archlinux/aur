# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=fofimon
pkgver=0.9
pkgrel=1
pkgdesc="Monitor selected folders and files for modifications"
url='https://efanomars.com/fofimon'
arch=('x86_64')
license=('GPL3')

depends=('glibmm')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("fofimon")
#replaces=("fofimon")
#conflicts=("fofimon")

source=('https://efanomars.com/sources/fofimon-0.9.tar.gz')
sha256sums=('722674a8d88b7614b32732ce9c61266155b712667e5bb139f3227fb1e3be2949')

build() {
  cd "${srcdir}/fofimon"

  ./scripts/install_fofimon.py -b=Release  --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/fofimon"

  ./scripts/priv/dd_install_fofimon.py -b=Release  --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}

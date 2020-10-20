# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=fspropfaker
pkgver=0.1
pkgrel=1
pkgdesc="File-system property faker library based on fuse"
url='https://efanomars.com/libraries/fspropfaker'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

depends=(
    'fuse')
makedepends=('cmake' 'gcc' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("fspropfaker")
#replaces=("fspropfaker")
#conflicts=("fspropfaker")

source=('https://efanomars.com/sources/fspropfaker-0.1.tar.gz')
sha256sums=('2e71524572e83e17e2205a5308e07fbb0538449e1b48866796c46be823e4be34')

build() {
  cd "${srcdir}/fspropfaker"

  ./scripts/install_fspropfaker-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/fspropfaker"

  ./scripts/priv/dd_install_fspropfaker-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}


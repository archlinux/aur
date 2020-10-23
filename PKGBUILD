# Maintainer: Stefano Marsili <efanomars@gmx.ch>

pkgname=fspropfaker
pkgver=0.2
pkgrel=1
pkgdesc="File-system property faker library based on fuse"
url='https://efanomars.com/libraries/fspropfaker'
arch=('x86_64' 'i686' 'aarch64')
license=('GPL3')

depends=(
    'fuse')
makedepends=('cmake' 'doxygen' 'graphviz' 'python')
optdepends=()

#provides=("fspropfaker")
#replaces=("fspropfaker")
#conflicts=("fspropfaker")

source=('https://efanomars.com/sources/fspropfaker-0.2.tar.gz')
sha256sums=('b136c281280955a1b8e7e7e124fc99557f0125b861bd20d03a717c77bbddcf15')

build() {
  cd "${srcdir}/fspropfaker"

  ./scripts/install_fspropfaker-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --no-install --no-sudo
}

package() {
  cd "${srcdir}/fspropfaker"

  ./scripts/priv/dd_install_fspropfaker-all.py -b=Release -s=Off -t=Off -d=Off --installdir="/usr" --destdir="${pkgdir}" --no-configure --no-make --no-sudo
}


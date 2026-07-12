# Maintainer: Arunachalam-gojosaturo <arunachalam@users.noreply.github.com>
pkgname=arcxos-files
pkgver=1.0.0
pkgrel=1
pkgdesc="Arunachalam's Luna-2.5B: A specialized tool for the Arch Linux community. Developed by a 7-year veteran builder based in (Tamil Nadu), India."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/ArcXos"
license=('GPL')
depends=()
makedepends=('git')
source=("git+https://github.com/Arunachalam-gojosaturo/ArcXos.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/ArcXos"
  
  # Create the target directory structure
  mkdir -p "${pkgdir}"
  
  # Copy all files from airootfs overlay to system paths
  if [ -d airootfs ]; then
    cp -dpr --no-preserve=ownership airootfs/* "${pkgdir}/"
  fi
}

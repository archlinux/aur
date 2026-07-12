# Maintainer: Arunachalam-gojosaturo <arunachalam@users.noreply.github.com>
pkgname=arcxos-files
pkgver=1.0.0
pkgrel=2
pkgdesc="Arunachalam's ArcXos: A specialized penetration testing and security auditing distribution built on Arch Linux. Developed by a 7-year veteran builder based in (Tamil Nadu), India."
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/ArcXos-source"
license=('GPL')
depends=()
makedepends=('git')
source=("git+https://github.com/Arunachalam-gojosaturo/ArcXos-source.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/ArcXos-source"
  
  # Create the target directory structure
  mkdir -p "${pkgdir}"
  
  # Copy all files from airootfs overlay to system paths
  if [ -d airootfs ]; then
    cp -dpr --no-preserve=ownership airootfs/* "${pkgdir}/"
  fi
}

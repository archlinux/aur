# Maintainer: Manel Castillo Giménez
pkgname="sempiternum"
pkgver="0.1.0"
pkgrel="1"
pkgdesc="Software to analyze Holomorphic Maps and their dynamics"
arch=("x86_64")
url="https://github.com/ManelCG/sempiternum"
depends=("libclc" "opencl-headers" "ocl-icd" "gtk3" "lib32-gtk3" "cairo" "lib32-cairo" "pango" "pixman")
optdepends=("opencl-amd" "opencl-nvidia")
_gitroot="https://github.com/ManelCG/Sempiternum.git"
_gitname="sempiternum"
source=()
sha256sums=()

package(){
  echo "Building Sempiternum..."
  cd ${srcdir}

  echo "Downloading Sempiternum from github..."
  if [ -d ${srcdir}/${_gitname} ]; then
    cd "${srcdir}/${_gitname}"
    git pull origin
    echo "Local files updated..."
  else
    git clone ${_gitroot} ${srcdir}/${_gitname}
  fi

  echo "Git checkout done"

  cd ${srcdir}/${_gitname}

  echo "Starting configure"

  make BDIR=${pkgdir} archlinux
}

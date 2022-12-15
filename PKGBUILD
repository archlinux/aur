# Maintainer: Manel Castillo Giménez
pkgname="horizonwm"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Official WM of Horizon Linux. Based on DWM."
arch=("x86_64")
url="https://github.com/ManelCG/HorizonWM"
depends=("make" "pkgconf" "grep" "awk")
conflicts=("horizonwm-git")
optdepends=()

_tag="v1.0.0"

_gitroot="https://github.com/ManelCG/HorizonWM.git"
_gitname="HorizonWM"

source=("git+$_gitroot#tag=$_tag"
        )

sha256sums=("SKIP"
            )

package(){
  echo "Building HorizonWM..."

  cd ${srcdir}/${_gitname}
  git checkout $_tag

  echo "Git checkout done"

  echo "Starting configure"

  make BDIR=${pkgdir} archlinux
}

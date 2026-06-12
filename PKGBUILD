# Maintainer: Ardox <ardox@axos-project.com>
pkgname=sleex-user-config-git
_pkgname=sleex
pkgver=1.12.r661.33b1e23
pkgrel=1
pkgdesc="User configuration for Sleex desktop environment (git version)"
arch=("x86_64")
url="https://github.com/axos-project/sleex"
license=('GPL3')
optdepends=("sleex-git: the desktop env that goes with it")
provides=("sleex-user-config" "axskel-hypr")
conflicts=("sleex-user-config" "axskel-hypr")
source=("https://github.com/axos-project/sleex.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.12.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package(){
   cd "$srcdir/$_pkgname/sleex-user-config"
   
   mkdir -p "${pkgdir}/etc/skel/"
   # On copie les fichiers de config
   cp -r src/.config/ "${pkgdir}/etc/skel/"
   cp -r src/.local/ "${pkgdir}/etc/skel/"
}

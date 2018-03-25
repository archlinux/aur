 
# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com>

pkgname=breezemite-yakuake-git
_gitname=breezemite-yakuake
pkgver=r6.4adf479
pkgrel=1
pkgdesc="Breezemite themes for Yakuake."
arch=('any')
url="https://github.com/matijaskala/breezemite-yakuake"
license=('GPL2')
depends=('yakuake')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  
   cd ${srcdir}/${_gitname}

   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  
}


package() {
    
   mkdir -p  ${pkgdir}/usr/share/yakuake/skins/{breezemite,breezemite_dark,breezemite_dark_rhs}
   cp -r ${srcdir}/${_gitname}/{breezemite,breezemite_dark,breezemite_dark_rhs} ${pkgdir}/usr/share/yakuake/skins/

}


pkgname=mcmuse-icon-theme-git
_gitname=McMuse-icon-theme
pkgver=27.54a1019
pkgrel=1
pkgdesc="A colorful Design icon theme for linux desktops"
arch=('any')
makedepends=('git' 'gtk-update-icon-cache')
license=('GPL3')
url="https://github.com/yeyushengfan258/${_gitname}"
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "${srcdir}/${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/${_gitname}"
  install -dm755 "${pkgdir}/usr/share/icons"
  ./install.sh  \
    --all \
    --dest "${pkgdir}/usr/share/icons"
}
 

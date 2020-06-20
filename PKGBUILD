# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Robosky <fangyuhao0612@gmail.com>

pkgname=mcmojave-circle-icon-theme-git
_gitname=McMojave-circle
pkgver=88.1580968
pkgrel=1
pkgdesc="MacOSX Mojave like circle icon theme for linux desktops"
arch=('any')
makedepends=('git' 'gtk-update-icon-cache')
optdepends=('mojave-gtk-theme-git: Recommended GTK theme')
license=('GPL3')
url="https://github.com/vinceliuice/${_gitname}"
source=("mcmojave-circle-icon-theme::git+${url}")
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
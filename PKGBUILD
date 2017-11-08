# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=papirus-folders-git
pkgver=0.0.2.1.ga58a5d0
pkgrel=3
pkgdesc="Allows to change the color of folders (git version)"
url="https://github.com/PapirusDevelopmentTeam/papirus-folders"
arch=('any')
license=('LGPL3')
depends=('papirus-icon-theme')
makedepends=('git')
provides=("papirus-folders")
options=('!strip')
source=("${pkgname}::git+https://github.com/PapirusDevelopmentTeam/papirus-folders.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/./g'

}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}/" install
}

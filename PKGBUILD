pkgname=pug-hook-noupgrade-git
pkgver=r60.e4bb973
pkgrel=1
pkgdesc='Automatically saves and synchronizes Pacman and AUR installed package lists into Gists.'
arch=('any')
license=('GPL')
depends=('gist')
makedepends=('git')
conflicts=('pug')
url="https://github.com/Ventto/pug"
source=("git+https://github.com/Ventto/pug.git")
sha256sums=('SKIP')

_srcname=pug

pkgver() {
    cd "${srcdir}/${_srcname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_srcname}"
  make DESTDIR="${pkgdir}" install
}

pkgname=pug-hook-git
_pkgname=pug
pkgver=20200107.e4bb973
pkgrel=1
pkgdesc='Automatically saves and synchronizes Pacman and AUR installed package lists into Gists.'
arch=('x86_64' 'i686')
license=('GPL')
depends=('pacman' 'gist>=4.5.0')
makedepends=('make' 'git')
conflicts=('pug')
url="https://github.com/Ventto/pug"
source=("git+https://github.com/Ventto/pug")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

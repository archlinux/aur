# Maintainer: csllbr

_pkgname=orgmk
pkgname=orgmk-git
pkgver=r45.42ceb56
pkgrel=1
pkgdesc='Export Org mode documents to HTML, PDF, etc.'
url='https://github.com/fniessen/orgmk'
license=('GPL')
source=('git+https://github.com/fniessen/orgmk.git')
sha256sums=('SKIP')
arch=('any')
depends=('emacs')
makedepends=('git')
conflicts=('')
provides=('orgmk')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
 
  make DESTDIR="$pkgdir/" install
  #make
  # Install the program.
  #install -Dm755 aurvote "${pkgdir}/usr/bin/aurvote"
  #install -Dm644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_aurvote"
}
# Maintainer: timescam <timescam at duck dot com>

pkgname=materia-theme-dracula-git
pkgdesc="This is the Materia theme except with Dracula colors. Modified by afraidofmusic"
pkgver=r1474.46ae66a2
pkgrel=1
arch=('any')
url="https://github.com/afraidofmusic/materia-theme-dracula"
license=('GPL')
makedepends=('git' 'sassc')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
provides=('materia-theme')
conflicts=('materia-theme')
source=(${pkgname}::git+https://github.com/afraidofmusic/materia-theme-dracula.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -d "${pkgdir}/usr/share/themes"
}


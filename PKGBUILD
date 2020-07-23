# Maintainer: timescam <rex.ky.ng at gmail dot com>

pkgname=materia-theme-dracula-git
pkgdesc="This is the Materia theme except with Dracula colors. Modified by afraidofmusic"
arch=('any')
url="https://github.com/afraidofmusic/materia-theme-dracula"
license=('GPL')
makedepends=('git')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
optdepends=()
provides=('materia-theme')
conflicts=('materia-theme')
replaces=()
source=(${pkgname}::git+https://github.com/afraidofmusic/materia-theme-dracula.git)
sha256sums=('SKIP')

pkgver=r1406.990af9fb
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgrel=1

package() {
  cd "$srcdir/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -d "${pkgdir}/usr/share/themes"
}


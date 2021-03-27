# Maintainer: antsa <asss1924 <plus> aur <at> gmail <dot> com>
# Contributor: cth451 <cth451@gmail.com>
pkgname=materia-theme-git
pkgdesc="upstream git package for the Material Design-like flat theme for GTK4, GTK3, GTK2, Metacity, and GNOME-Shell."
arch=('any')
url="https://github.com/nana-4/materia-theme"
license=('GPL')
makedepends=('git' 'sassc' 'meson>=0.47.0')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
optdepends=()
provides=('materia-theme')
conflicts=('materia-theme')
replaces=()
source=(${pkgname}::git+https://github.com/nana-4/materia-theme.git)
sha256sums=('SKIP')

pkgver=r1609.79b71a42
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgrel=1

package() {
  cd "$srcdir/${pkgname}"
  meson _build -Dprefix="${pkgdir}/usr"
  meson install -C _build
}

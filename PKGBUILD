# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme-git
pkgdesc="upstream git package for the Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
makedepends=('git')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme')
replaces=()
source=(${pkgname}::git+https://github.com/nana-4/Flat-Plat.git)
sha256sums=('SKIP')

pkgver=r278.87c093b
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1

package() {
  cd "$srcdir/${pkgname}"
  destdir="${pkgdir}" ./install.sh
}

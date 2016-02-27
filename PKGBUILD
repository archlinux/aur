# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme-git
pkgdesc="upstream git package for the Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contains chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
makedepends=('git')
depends=('librsvg' 'gtk-engine-murrine' 'gnome-session>=3.14')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme')
replaces=()
source=(${pkgname}::git+https://github.com/nana-4/Flat-Plat.git)
sha256sums=('SKIP')

pkgver=r28.21499c1
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
pkgrel=1

package() {
  cd "$srcdir/${pkgname}"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  cp -r --no-preserve='ownership,mode' 'gnome-shell' 'gtk-2.0' 'gtk-3.0' 'index.theme' "${pkgdir}"/usr/share/themes/Flat-Plat
}

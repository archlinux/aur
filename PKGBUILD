# Maintainer: Daniel Cafe
# Contributor: 

pkgname=qogir-gtk-theme-git
pkgver=2020.02.26.r59.gebed08a
pkgrel=1
pkgdesc='Qogir is a flat Design theme for GTK'
arch=('any')
url='https://github.com/vinceliuice/Qogir-theme'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('git')
optdepends=()
provides=('qogir-gtk-theme')
conflicts=('qogir-gtk-theme')
source=('git+https://github.com/vinceliuice/Qogir-theme')
sha256sums=('SKIP')

pkgver() {
  cd Qogir-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd Qogir-theme
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -d "${pkgdir}/usr/share/themes"
}

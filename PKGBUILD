# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme-laptop
pkgver=3.22.20160921
pkgrel=1
pkgdesc="Laptop variation of Flat-Plat, a Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.22','gtk-engine-murrine', 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme-laptop')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/v${pkgver}/Flat-Plat-laptop-${pkgver}.tar.gz")
sha256sums=('d3f2df5662ea201ba078c2ef66b2e116b941b84025fdf352d51cff1b55e3be27')

package() {
  cd "Flat-Plat-laptop"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat-laptop
  rm -rf chrome img
  sed -i 'index.theme' -e "s/Flat-Plat/Flat-Plat-laptop/g"
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat-laptop
}

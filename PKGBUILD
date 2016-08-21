# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme-laptop
pkgver=3.20.20160821
pkgrel=2
pkgdesc="Laptop variation of Flat-Plat, a Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.20','gtk-engine-murrine', 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme-laptop')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/v${pkgver}/Flat-Plat-laptop-${pkgver}.tar.gz")
sha256sums=('cf3641fc7135e76d3530fb15df8c6d013bdac4024f965ea9f6b79fa141970df2')

package() {
  cd "Flat-Plat-laptop"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat-laptop
  rm -rf chrome img
  sed -i 'index.theme' -e "s/Flat-Plat/Flat-Plat-laptop/g"
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat-laptop
}

# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-gui-bin
_pkgname=catppuccinifier
pkgver=9.0.0 # renovate: datasource=github-tags depName=lighttigerXIV/catppuccinifier
pkgrel=1
pkgdesc="An application to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
provides=('catppuccinifier-gui')
conflicts=('catppuccinifier-gui')
depends=('cmake' 'libadwaita' 'webkit2gtk' 'base-devel' 'curl' 'wget' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('git')
source=("https://github.com/lighttigerXIV/${_pkgname}/releases/download/${pkgver}/Catppuccinifer-Linux-${pkgver}.tar.xz")
md5sums=('4616926942c4800928fd81a88c1e77bf')

build() {
  tar -xf "Catppuccinifer-Linux-${pkgver}.tar.xz"
}

package() {
  cd "${srcdir}/Catppuccinifer-Linux-${pkgver}/installation-files"
  #desktop file
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications" "Catppuccinifier.desktop"
  #binary
  install -Dm755 "catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
  #icon
  install -Dm644 "catppuccinifier.png" "$pkgdir/usr/share/pixmaps/catppuccinifier.png"
}

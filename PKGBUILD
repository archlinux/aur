# Maintainer: Isabel <isabel@isabelroses.com>
pkgname=catppuccinifier-bin
_pkgname=catppuccinifier
pkgver=9.1.0 # renovate: datasource=github-tags depName=lighttigerXIV/catppuccinifier
pkgrel=1
pkgdesc="An application to catppuccinifiy your images."
arch=('x86_64')
url="https://github.com/lighttigerXIV/catppuccinifier"
license=()
provides=('catppuccinifier' 'catppuccinifier-gui')
conflicts=('catppuccinifier' 'catppuccinifier-gui')
depends=('cmake' 'libadwaita' 'webkit2gtk' 'base-devel' 'curl' 'wget' 'openssl' 'appmenu-gtk-module' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
makedepends=('git')
source=("https://github.com/lighttigerXIV/${_pkgname}/releases/download/${pkgver}/Catppuccinifier-Linux-${pkgver}.tar.xz")
md5sums=('5dbd9ff23d534f097fd41f8affb4af3e')

build() {
  tar -xf "Catppuccinifier-Linux-${pkgver}.tar.xz"
}

package() {
  cd "${srcdir}/Catppuccinifier-Linux-${pkgver}/installation-files"
  #desktop file
  desktop-file-install -m 644 --dir "$pkgdir/usr/share/applications" "Catppuccinifier.desktop"
  #binarys
  install -Dm755 "catppuccinifier" "$pkgdir/usr/bin/catppuccinifier"
  install -Dm755 "catppuccinifier-gui" "$pkgdir/usr/bin/catppuccinifier-gui"
  #icon
  install -Dm644 "catppuccinifier.png" "$pkgdir/usr/share/pixmaps/catppuccinifier.png"
}

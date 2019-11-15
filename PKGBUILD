# Maintainer: basigur

pkgname=papirus-folders-nordic
_pkgname=papirus-folders
pkgver=4.5
pkgrel=2
pkgdesc="Icons themes papirus color folder nordic"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/basigur/papirus-folders/archive/v${pkgver}.tar.gz")
sha256sums=('19d4a1b23c2ec91d3a6daee2e65260634b9a7d1abfdf7756c08c66239958cf8f')


prepare() {
  cd "${_pkgname}"-"${pkgver}"
    sed -i 's!gtk-update-icon-cache!#gtk-update-icon-cache!' papirus-nordic.sh
}


build() {
  cd "${_pkgname}"-"${pkgver}"
    bash papirus-nordic.sh
}


package() {
  cd "${_pkgname}"-"${pkgver}"
    install -d "${pkgdir}/usr/share/icons"
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    cp -r build/*/ "$pkgdir/usr/share/icons/"
}


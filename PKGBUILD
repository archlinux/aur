# Maintainer: Francois Menning <f.menning@pm.me>

pkgname=qogir-gtk-theme-git
pkgver=2022.10.16.r15.g5f0d167
pkgrel=1
pkgdesc='Qogir is a flat Design theme for GTK'
arch=('any')
url='https://github.com/vinceliuice/Qogir-theme'
license=('GPL3')
depends=('gtk3' 'gtk4' 'gtk-engine-murrine' 'gtk-engines')
makedepends=('git' 'sassc')
optdepends=(
  'qogir-icon-theme: Matching icon theme'
)
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

  install -dm755 "${pkgdir}/usr/share/themes"
  
  ./install.sh \
    --dest "${pkgdir}/usr/share/themes" \
    --theme all \
    --icon arch \
    --libadwaita \
    --tweaks image
}

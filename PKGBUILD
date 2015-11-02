# Maintainer: Nattapong Pullkhow <exenatt at gmail dot com>
# Contributor: Nattapong Pullkhow <exenatt at gmail dot com>
# Updated for AUR by Robbie <zoqaeski at gmail dot com>

pkgname=xenlism-wildfire-icon-theme-git
_pkgname=xenlism-wildfire-icon-theme
pkgver=146.39d6443
pkgrel=1
pkgdesc="Minimalism And Realism Mix and match, Meego And iOS icon Style"
url="https://xenlism.github.io/wildfire"
depends=('gtk-update-icon-cache')
makedepends=('git')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
arch=('any')
license=('GPL')
source=(${_pkgname}::'git+https://github.com/xenlism/wildfire.git')
install=xenlism-wildfire.install
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -dm755 "${pkgdir}/usr/share/icons"
  cd "${srcdir}/${_pkgname}/icons/"
  cp -r * "${pkgdir}/usr/share/icons/";
  find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
  install -dm755 "${pkgdir}/usr/share/backgrounds/gnome/"
  cd "${srcdir}/${_pkgname}/wallpapers/";
  install -dm755 "${pkgdir}/usr/share/backgrounds/xenlism/";
  cp -r * "${pkgdir}/usr/share/backgrounds/xenlism/";
  find "${pkgdir}/usr/share/backgrounds/xenlism/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/backgrounds/xenlism/" -type f -exec chmod 644 '{}' \;
  cd "${srcdir}/${_pkgname}/background-properties/";
  install -dm755 "${pkgdir}/usr/share/gnome-background-properties/";
  cp -r * "${pkgdir}/usr/share/gnome-background-properties/";
  find "${pkgdir}/usr/share/gnome-background-properties/" -type d -exec chmod 755 '{}' \;
  find "${pkgdir}/usr/share/gnome-background-properties/" -type f -exec chmod 644 '{}' \;
}


# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=moka-icon-theme
pkgname=${_pkgname}-git
pkgver=5.4.0
pkgrel=1
pkgdesc="An icon theme designed with a minimal, flat style, using simple geometry & colours."
arch=('any')
url="https://github.com/moka-project/moka-icon-theme"
license=('GPL3')
depends=('gtk-update-icon-cache')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
replaces=("${_pkgname}")
options=(!strip)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
install=${_pkgname}.install

package() {
    install -d -m 755 "${pkgdir}"/usr/share/icons/Moka
    cp -dr --no-preserve=ownership "${_pkgname}-${pkgver}"/Moka "${pkgdir}"/usr/share/icons/
    find "${pkgdir}"/usr/share/icons/ -type d -exec chmod 755 {} \;
    find "${pkgdir}"/usr/share/icons/ -type f -exec chmod 644 {} \;
}

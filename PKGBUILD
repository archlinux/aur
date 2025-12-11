# Maintainer: quest <quest at mac dot com>

pkgname="celestial-gtk-theme"
pkgver=1.3.0
pkgrel=1
pkgdesc='A modern, customizable GTK theme with multiple color variants.'
arch=('any')
url="https://github.com/zquestz/$pkgname"
license=('GPL-3.0-or-later')
makedepends=('sassc' 'which')
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'papirus-icon-theme: recommended icon theme'
  'kvantum: Qt theme support'
)
conflicts=("${pkgname}-git")
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('6fb199c26f2780f58fc207419830ced4a8252e3a726800059bafefd445408abb8b438148331651080864d40dbb9cec6a601fd1c1684e8675a37cb16793dbf661')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes"
  install -d "${pkgdir}/usr/share/Kvantum"

  DESTDIR=${pkgdir} ./install.sh -k -b --copyq --cursors --ghostty --dest "/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

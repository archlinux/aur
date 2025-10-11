# Maintainer: quest <quest at mac dot com>

pkgname="celestial-gtk-theme"
pkgver=1.0.1
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
  'whitesur-cursor-theme: recommended cursor theme'
)
conflicts=("${pkgname}-git")
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
b2sums=('82ce504f28b5f87de144fb8861bb4596e9bf4b19d6726e49b2aa2ff62804cb4dd34f8828353a7a8aca1a605a03ec52f509cf3d7e88daf8ee5fdd7b3ed95ae9c6')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes"

  DESTDIR=${pkgdir} ./install.sh --dest "/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

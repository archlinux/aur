# Maintainer: quest <quest at mac dot com>

pkgname="celestial-gtk-theme"
pkgver=1.0.3
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
b2sums=('057819e9ca4312697a62885e0b7c0dce7aefe5ace546ce45ac2ebacc8a1e71be795bca49fc1cb9b465d332886e9797ae7346adabd6b03d426c5e19d909e853c0')

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/themes"

  DESTDIR=${pkgdir} ./install.sh --dest "/usr/share/themes"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

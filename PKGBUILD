# Maintainer: Pablo Lezaeta Reyes (JotaRandom) <prflr88@gmail.com>
# Contributor: Mark Wagie (yochananmarqos) <mark.wagie@proton.me>

pkgname=xapp-symbolic-icons
pkgver=1.0.5
pkgrel=1
pkgdesc="A set of symbolic icons for GTK applications and projects"
arch=('any')
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=('GPL-3.0-only' 'LGPL-3.0-only')
provides=('xsi-symbolic-icons')
depends=(
  'hicolor-icon-theme'
  'python'
)
makedepends=(
  'git'
  'meson'
)

source=("git+https://github.com/xapp-project/xapp-symbolic-icons.git#tag=${pkgver}")
sha256sums=('6a9c1c4ed65648c32121658d180762551feea4562794599f66cccde73bef8415')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}

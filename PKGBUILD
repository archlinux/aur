# Maintainer: Pablo Lezaeta Reyes (JotaRandom) <prflr88@gmail.com>
# Contributor: ark Wagie (yochananmarqos) <mark.wagie@proton.me>

pkgname=xapp-symbolic-icons
pkgver=1.0.1
pkgrel=1
pkgdesc="A set of symbolic icons for GTK applications and projects"
arch=('any')
url="https://github.com/xapp-project/xapp-symbolic-icons"
license=('GPL-3.0-only' 'LGPL-3.0-only')
depends=(
  'hicolor-icon-theme'
  'python'
)
makedepends=(
  'git'
  'meson'
)

source=("git+https://github.com/xapp-project/xapp-symbolic-icons.git#tag=${pkgver}")
sha256sums=('5d4b8225983cf43da7e204ba8c81141eb2e39f3a1ed06ee96c4ad12d4324091d')

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}


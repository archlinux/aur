# Maintainer: NEOAPPS <neo@obsidianos.xyz> <asd22.info@gmail.com>
# Maintainer: TheOddCell <odd@obsidianos.xyz>
pkgname=obsidianos-kcm-git
pkgver=1.0.0
pkgrel=1
pkgdesc="KDE System Settings module for ObsidianOS management"
arch=('x86_64')
url="https://github.com/Obsidian-OS/kcm"
license=('GPL-3.0-or-later')
depends=(
  'qt6-base'
  'qt6-declarative'
  'kirigami'
  'obsidianctl'
  'polkit'
  'systemsettings'
  'obsidianos-branding'
)
makedepends=(
  'cmake'
  'extra-cmake-modules'
  'qt6-tools'
)
source=("git+https://github.com/Obsidian-OS/kcm.git")
sha256sums=('SKIP')
build() {
  cd kcm
  make -j$(nproc) -B
}

package() {
  cd kcm
  make DESTDIR="$pkgdir" install
}

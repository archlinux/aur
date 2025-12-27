# Maintainer: compiledkernel-idk <berkkapla82@proton.me>
# Contributor: pacboost contributors

pkgname=pacboost-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="High-performance package manager frontend for Arch Linux with integrated AUR support (precompiled binary)"
arch=('x86_64')
url="https://github.com/compiledkernel-idk/pacboost"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'pacman' 'git' 'base-devel')
optdepends=(
  'sudo: for privilege escalation during AUR package building'
  'asp: for advanced source package management'
)
provides=('pacboost')
conflicts=('pacboost' 'pacboost-git')
backup=()
source=("pacboost-x86_64-linux.tar.gz::https://github.com/compiledkernel-idk/pacboost/releases/download/v$pkgver/pacboost-x86_64-linux.tar.gz")
sha256sums=('b225765f80204f39f1e57745381307b82a11c5b8b13a0e03803447f635b0d80a')

package() {
  # Install binary
  install -Dm755 "pacboost" "$pkgdir/usr/bin/pacboost"
  
  # Install documentation (if included in release tarball)
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/pacboost/README.md"
  fi
  
  if [ -f CHANGELOG.md ]; then
    install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/pacboost/CHANGELOG.md"
  fi
  
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pacboost/LICENSE"
  fi
  
  if [ -f logo.svg ]; then
    install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/pacboost.svg"
  fi
}

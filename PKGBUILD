# Maintainer: Sebastian Wilzbach <sebi at wilzbach dot me>
pkgname=shell-tools-git
_pkgname=shell-tools
pkgrel=1
pkgver=v1
pkgdesc="collection of commonly used shell function"
arch=('any')
url="https://github.com/greenify/shell-tools"
license=('GPL3')
groups=()
depends=('xorg-xrandr' 'bash' 'findutils' 'gawk')
makedepends=('git')
optdepends=()
source=('git+https://github.com/greenify/shell-tools')

package() {
  cd $_pkgname

  # binaries
  mkdir -p $pkgdir/usr/bin/

  # copy all executables
  find . -executable -not -path '*/\.*' -type f -exec cp {} $pkgdir/usr/bin \;

  # shared
  mkdir -p $pkgdir/usr/share/$_pkgname
  cp README.md $pkgdir/usr/share/$_pkgname
  cp LICENSE $pkgdir/usr/share/$_pkgname
}

pkgver() {
  cd $_pkgname
  echo "v"$(git rev-list --count master)
}

md5sums=('SKIP')

# vim:set ts=2 sw=2 et:

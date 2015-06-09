# Maintainer: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>

_pkgname=aurdupes
pkgname=aurdupes-git
pkgver=latest
pkgrel=1
pkgdesc='Find duplicate AUR packages (development version)'
url='http://git.cryptocrack.de/aurdupes.git'
license=('BSD')
source=('git+http://git.cryptocrack.de/aurdupes.git')
sha256sums=('SKIP')
arch=('any')
depends=('perl' 'wget')
makedepends=('git')
conflicts=('aurdupes')
provides=('aurdupes')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # Get the version number.
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_pkgname}"

  # Install the program.
  install -Dm755 aurdupes.py "${pkgdir}/usr/bin/aurdupes"
}

# vim: ft=sh ts=2 sw=2 et

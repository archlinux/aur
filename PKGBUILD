# Maintainer: Kyle <kyle@gmx.ca>
pkgname=files-f123light-git
_gitname=files-F123Light
pkgver=0.0 # automatically determined from git origin
pkgrel=1
pkgdesc="System and user configuration files, scripts and other files specific to F123Light, an ArchLinuxARM-based operating system for the Raspberry Pi 2 and 3"
arch=(any)
url="http://f123.org"
license=('GPL3')
depends=('')
makedepends=('git')
provides=('')
conflicts=('')
source=('git+https://github.com/F123/files-F123Light.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed -e 's|v||' -e 's|-|.|g'
}

package() {
  cd $_gitname
  cp -a files/* $pkgdir
}

# vim:set ts=2 sw=2 et:

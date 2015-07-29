# Maintainer: Tom Kuther tom@kuther.net>
pkgname=sony-gpsassist-update-git
_gitname=sony-gpsassist-update
pkgver=10.e0a5c18
pkgrel=1
pkgdesc="Auto-update GPS_A data for Sony Alpha cameras"
arch=('i686' 'x86_64')
url="https://github.com/gimpel/sony-gpsassist-update"
license=('GPL')
makedepends=('git')
backup=('etc/sony-gpsassist-update.cfg')
source=("${_gitname}::git+https://github.com/gimpel/sony-gpsassist-update.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  DESTDIR="$pkgdir/" ./install.sh
}

# vim:set ts=2 sw=2 et:

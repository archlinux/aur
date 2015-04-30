# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Laurie Clark-Michalek <bluepeppers@archlinux.us>
# Contributor: graysky <graysky AT archlinux DOR us>

pkgname=archey3
pkgver=0.5
pkgrel=3
pkgdesc='Output a logo and various system information'
arch=('any')
url='http://bluepeppers.github.com/archey3'
license=('GPL')
depends=('python')
makedepends=('git' 'python-distribute')
optdepends=('imagemagick: for default screenshot command')
# AUR optdeps: python-logbook-git and python-mpd-git
source=('git://github.com/bluepeppers/archey3.git#commit=94b3d549ef')
md5sums=('SKIP')

pkgver() {
  # Fetch the version number from the PKGBUILD in the upstream git repo
  grep pkgver= "$pkgname/PKGBUILD" | cut -d'=' -f2
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir"
} 

# getver: -d 2 -u 5
# vim:set ts=2 sw=2 et:

# Maintainer: kacgal <kacgal@gmail.com>
pkgname=as2-tracker-git
pkgver=1.0
pkgrel=1
pkgdesc="A tracker for Audiosurf2"
arch=('any')
url="https://github.com/kacgal/AS2_Tracker_Python"
license=('unknown')
depends=('python' 'python-requests' 'steam')
makedepends=('git')
install=
source=('git+https://github.com/kacgal/AS2_Tracker_Python.git')
md5sums=('SKIP') #generate with 'makepkg -g'

prepare() {
  cd "$srcdir/AS2_Tracker_Python"
  sed -i '1s;^;\#!/bin/python3\n;' "tracker.py"
}

package() {
  cd "$srcdir/AS2_Tracker_Python"
  mkdir -p "$pkgdir/usr/bin"
  chmod +x "tracker.py"
  mv "tracker.py" "$pkgdir/usr/bin/as2-tracker"
}

# vim:set ts=2 sw=2 et:

# Maintainer: willemw <willemw12@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Andrew Felske <knopper67@archlinux.us>

pkgname=helixnotes
pkgver=0.2
pkgrel=3
pkgdesc="Lightweight note-taker written in Python with PyGTK"
arch=('any')
url="http://code.google.com/p/helixnotes/"
license=('GPL3')
depends=('pygtk' 'python2')
source=("http://www.gtk-apps.org/CONTENT/content-files/112271-helix.tar.gz")
md5sums=('af5d561ca964d86c27b433d81213a885')

package() {
  cd helix
  sed -i "s|bash|sh|" scripts/helix
  sed -i "s|python|python2|" scripts/helix src/helix.py
  sed -i "s|XDG_CONFIG_HOME|HOME/.config|" src/var.py
  sed -i "s|XDG_DATA_HOME|HOME/.config|" src/var.py
  python2 setup.py install --root="$pkgdir"
}


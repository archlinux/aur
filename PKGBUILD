# Maintainer: Logan Marchione <logan (at) loganmarchione (dot) com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>

_gitname=variety
pkgname=${_gitname}-git
pkgver=0.7.0.r3.g48adbd5
pkgrel=1
pkgdesc="Variety wallpaper changer (git version)"
arch=('any')
url="https://github.com/varietywalls/variety"
license=('GPL3')
depends=('python3' 'gtk3' 'imagemagick' 'libgexiv2' 'libnotify'
         'python-beautifulsoup4' 'python-lxml' 'python-cairo'
         'python-configobj' 'python-pillow' 'python-requests' 'python-dbus' 'python-gobject' 'python-httplib2'
         'python-pycurl')
makedepends=('git' 'python-distutils-extra')
optdepends=('xdg-user-dirs: set wallpaper for KDE Plasma')
provides=('variety')
conflicts=('variety')
source=(git+https://github.com/varietywalls/variety)
md5sums=(SKIP)

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# Maintainer: Martin Wagner <martin.wagner.dev@gmail.com>
# Contributor: Martin Wagner <martin.wagner.dev@gmail.com>

pkgname=mpdevil-git
pkgver=v0.9.0.r0.g6b5526a
pkgrel=1
pkgdesc="A small MPD client written in python (git version)"
arch=('any')
license=('GPL-3')
url="https://github.com/SoongNoonien/mpdevil"
depends=('python-mpd2' 'gtk3' 'libnotify' 'python-gobject' 'python-requests' 'python-beautifulsoup4' 'python-dbus')
makedepends=('git' 'python-distutils-extra')
provides=('mpdevil')
conflicts=('mpdevil')
source=('git+https://github.com/SoongNoonien/mpdevil.git')
md5sums=('SKIP')
_gitname="mpdevil"

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --prefix=$pkgdir/usr
}


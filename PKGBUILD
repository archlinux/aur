# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=rapid-photo-downloader-bzr
pkgver=r828
pkgrel=1
pkgdesc="Photo and video downloader"
arch=('any')
url="http://www.damonlynch.net/rapid/"
license=('GPL3')
depends=('desktop-file-utils' 'gstreamer' 'hicolor-icon-theme'
         'libgexiv2' 'libgudev' 'libnotify' 'perl-image-exiftool'
         'python-arrow' 'python-colour' 'python-colorlog'
         'python-dateutil' 'python-distutils-extra' 'python-easygui'
         'python-gobject' 'python-gphoto2' 'python-psutil'
         'python-pymediainfo' 'python-pyprind' 'python-pyqt5'
         'python-pyzmq' 'python-rawkit' 'python-sortedcontainers'
         'python-xdg' 'qt5-imageformats' 'udisks2')
makedepends=('bzr' 'gobject-introspection' 'intltool' 'python-setuptools')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=('bzr+lp:rapid')
sha256sums=('SKIP')

pkgver() {
  cd rapid
  printf "r%s" "$(bzr revno)"
}

build() {
  cd rapid
  python setup.py build
}

package() {
  cd rapid
  python setup.py install --root="${pkgdir}"
}

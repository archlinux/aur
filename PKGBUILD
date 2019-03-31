# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.4.4
pkgrel=1
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="https://www.openshot.org/"
license=('GPL')
depends=('python-mlt' 'sdl' 'librsvg' 'mplayer'
	 'pyxdg' 'python-pyqt5' 'python-httplib2' 'python-pillow' 'dvgrab'
	 'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image'
	 'libopenshot' 'python-pyzmq' 'qt5-webkit' 'python-setuptools'
	 'python-requests')
optdepends=('frei0r-plugins: effects'
	    'libquicktime' 'libavc1394' 'faac' 'jack')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v$pkgver.tar.gz")
sha256sums=('8197923b3fff2010ee69c75469818543674a12fcb8fcb08944471e4ead3426be')

package() {
  cd "$srcdir"/openshot-qt-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

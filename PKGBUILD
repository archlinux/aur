# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Florian Pritz <bluewind@xinu.at>
# Contributor: Asa Marco <marcoasa90[at]gmail[.]com>

pkgname=openshot
pkgver=2.4.1
pkgrel=1
pkgdesc="an open-source, non-linear video editor for Linux based on MLT framework"
arch=('any')
url="http://www.openshotvideo.com/"
license=('GPL')
depends=('mlt-python-bindings' 'sdl' 'librsvg' 'mplayer'
	 'pyxdg' 'python-pyqt5' 'python-httplib2' 'python-pillow' 'dvgrab'
	 'ladspa' 'sox' 'vid.stab' 'qt5-svg' 'sdl_image'
	 'libopenshot' 'python-pyzmq' 'qt5-webkit' 'python-setuptools'
	 'python-requests')
optdepends=('frei0r-plugins: effects'
	    'libquicktime' 'libavc1394' 'faac' 'jack' 'jack-rack')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OpenShot/openshot-qt/archive/v$pkgver.tar.gz")
sha256sums=('da388c08cd94ec503a57756871244d9bb8746973807e2f95618a0d9d5e11fae9')

package() {
  cd "$srcdir"/openshot-qt-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

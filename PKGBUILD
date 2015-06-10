# Contributor: ianux <ianux@free.fr>
pkgname=luciole
pkgver=0.9.3
pkgrel=2
pkgdesc="Stop-motion software"
arch=('i686' 'x86_64')
url="http://festival.inattendu.org/Luciole"
license=('GPL')
depends=('python2-dbus' 'gnome-python' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins'
	'gstreamer0.10-python' 'imagemagick' 'mjpegtools' 'python2' 'pygtk' 'python2-imaging'
        'python2-gudev')
optdepends=('ffmpeg: for export feature'
            'mencoder: for export feature')
source=(http://launchpad.net/luciole/0.9/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
md5sums=('a04ef1d9ea3e3071781f3c317e65845a')
sha1sums=('ec6a80eb697344387d02f6925cbf6526c06794d6')
install=${pkgname}.install

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=${pkgdir}
}

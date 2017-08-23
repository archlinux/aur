# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=foobnix
pkgver=3.1
pkgrel=1
pkgdesc="Music player for Linux"
arch=('i686' 'x86_64')
url="http://www.foobnix.com/"
license=('GPL3')
source=("https://github.com/foobnix/foobnix/archive/${pkgver}.tar.gz")
md5sums=('0602df86c4027d7ef36b0224c92553ed')
depends=('desktop-file-utils' 'gettext' 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'webkitgtk' 'gst-plugins-base-libs' 'gst-python2' 'mutagen' 'python2-chardet' 'python2-gobject' 'python2-keybinder2' 'python2-notify' 'python2-simplejson')
install=foobnix.install

build() {
  cd ${pkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  python2 setup.py install --root=${pkgdir}
}

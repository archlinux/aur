# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=foobnix
pkgver=3.1
pkgrel=2
pkgdesc="Music player for Linux"
arch=('i686' 'x86_64')
url="http://www.foobnix.com"
license=('GPL3')
source=("https://github.com/foobnix/foobnix/archive/$pkgver.tar.gz")
sha256sums=('a4fb20d1a015eeb07fe7611c577aea7290e71e4eff10f6e458d8c987353f97dd')
depends=('python2-chardet' 'python2-gobject' 'python2-simplejson' 'python2-mutagen' 'gst-plugins-good'
		'gst-plugins-base' 'gst-python2' 'webkitgtk' 'libkeybinder3' 'libnotify' 'gettext'
		'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'fuseiso' 'python2-notify' 'lame' 'faac'
		'python2-keybinder2' 'ffmpeg')
makedepends=('python2-setuptools')

build() {
  cd $pkgname-$pkgver
  python2 setup.py build
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

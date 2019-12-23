# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Brenton Horne <brentonhorne77 at gmail dot com>
pkgname=foobnix
pkgver=3.1
pkgrel=7
pkgdesc="GTK+ music player"
arch=('i686' 'x86_64')
url="http://www.foobnix.com"
license=('GPL3')
depends=('python2-chardet' 'python2-simplejson' 'python2-mutagen' 'gst-plugins-good'
         'gst-plugins-base' 'gst-plugins-ugly' 'gst-plugins-bad' 'gst-libav' 'gst-python2'
         'webkitgtk' 'libkeybinder3' 'fuseiso' 'python2-notify' 'python2-keybinder2' 'lame'
         'faac''ffmpeg' 'python2-dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a4fb20d1a015eeb07fe7611c577aea7290e71e4eff10f6e458d8c987353f97dd')

prepare() {
	cd $pkgname-$pkgver
	find . -name '*.py' -exec sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|g' {} \;
}

package() {
	cd $pkgname-$pkgver
	python2 setup.py install --root="$pkgdir/" --optimize=1
}

# Maintainer: Jesús Eduardo <heckyel@openmailbox.org>
# Contributor: David P. <megver83@parabola.nu>

_commit=a421c8dd0c54c3854c7004571d725f4b2d8b32ee
pkgname=librevideoconverter
pkgver=a421c8dd0c
pkgrel=1
pkgdesc="Simple video converter for WebM (vp8), Ogg Theora, MP4 and others, fork of Miro Video Converter"
arch=(any)
url="https://notabug.org/Heckyel/LibreVideoConverter"
license=('GPL3')
depends=('python2>=2.7.0' 'ffmpeg' 'ffmpeg2theora' 'gtk2' 'hicolor-icon-theme' 'pygtk')
makedepends=('python2-distribute')
conflicts=(miro-video-converter)
source=("$pkgname-$pkgver::$url/archive/${_commit}.tar.gz")
md5sums=('abfb7127fadc65af2716ccfb040b3366')

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -D mvc/resources/images/mvc-logo.png $pkgdir/usr/share/icons/mvc-logo.png
}

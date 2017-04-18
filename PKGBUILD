# Maintainer: Jesús Eduardo <heckyel@openmailbox.org>
# Contributor: David P. <megver83@parabola.nu>

_commit=0bca12ebd3bce5dc6e2aa61f7f1b552d0f101b1d
pkgname=librevideoconverter
pkgver=0bca12ebd3
pkgrel=1
pkgdesc="Simple video converter for WebM (vp8), Ogg Theora, MP4 and others, fork of Miro Video Converter"
arch=(any)
url="https://notabug.org/Heckyel/LibreVideoConverter"
license=('GPL3')
depends=('python2>=2.7.0' 'ffmpeg' 'ffmpeg2theora' 'gtk2' 'hicolor-icon-theme' 'pygtk')
makedepends=('python2-distribute')
conflicts=(miro-video-converter)
source=("$pkgname-$pkgver::$url/archive/${_commit}.tar.gz")
md5sums=('7e5a458d2ef78b45458d82ca96a32d28')

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1
	install -D mvc/resources/images/mvc-logo.png $pkgdir/usr/share/icons/mvc-logo.png
}

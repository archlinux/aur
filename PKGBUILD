# Maintainer: Alex Tharp <toastercup at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
_pkgname=foobnix
pkgname=foobnix-git
pkgver=3.2.r2.g17d5891f
pkgrel=1
pkgdesc="GTK+ music player"
arch=('i686' 'x86_64')
url="http://www.foobnix.com"
license=('GPL3')
depends=('python-chardet' 'python-simplejson' 'python-mutagen'
         'gst-plugins-good' 'gst-plugins-base' 'gst-plugins-ugly'
         'gst-plugins-bad' 'gst-libav' 'gst-python' 'webkit2gtk'
         'libkeybinder3' 'fuseiso' 'python-notify2' 'python3-keybinder'
         'lame' 'faac' 'ffmpeg' 'python-dbus' 'python-pylast')
makedepends=('git' 'python-setuptools')
provides=("foobnix")
conflicts=("foobnix")
source=('git+https://github.com/foobnix/foobnix.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
}

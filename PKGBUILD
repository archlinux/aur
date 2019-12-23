# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=foobnix-git
pkgver=3.1.r143.88804cc7
pkgrel=1
pkgdesc="GTK+ music player"
arch=('i686' 'x86_64')
url="http://www.foobnix.com"
license=('GPL3')
depends=('python-chardet' 'python-simplejson' 'python-mutagen' 'gst-plugins-good'
         'gst-plugins-base' 'gst-python' 'webkit2gtk' 'libkeybinder3' 'gst-plugins-bad'
         'gst-plugins-ugly' 'gst-libav' 'fuseiso' 'libnotify' 'lame' 'faac'
         'python3-keybinder' 'ffmpeg' 'python-dbus')
makedepends=('git')
optdepends=('python-pylast: Last.FM support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/foobnix/foobnix.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir/" --optimize=1
}

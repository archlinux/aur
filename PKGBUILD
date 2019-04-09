# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>

pkgname=green-recorder-git
pkgver=3.0.1.2.r2.ge7f877d
pkgrel=1
pkgdesc='A simple screen recorder for Linux desktop. Supports Wayland & Xorg'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/foss-project/${pkgname%-git}"
depends=('python2' 'libappindicator-gtk3' 'python2-gobject' 'gtk3' 'ffmpeg' 'gawk' 'python2-urllib3' 'python2-dbus' 'xorg-xdpyinfo' 'xorg-xwininfo' 'imagemagick' 'python2-configparser' 'xdg-utils' 'pulseaudio')
options=('!emptydirs')
source=("git://github.com/green-project/${pkgname%-git}.git")
sha1sums=('SKIP')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

pkgver() {
	cd "${pkgname%-git}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/${pkgname%-git}"
        python2 setup.py install --root="$pkgdir/" --optimize=1
}

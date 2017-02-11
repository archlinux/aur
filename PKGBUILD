# Maintainer: Emilien Devos (unixfox) <contact@emiliendevos.be>

pkgname=green-recorder-git
pkgver=1.1.r6.g43d5317
pkgrel=1
pkgdesc='A simple yet functional desktop recorder for Linux systems.'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/green-project/${pkgname%-git}"
depends=('python2' 'libappindicator-gtk3' 'python2-gobject' 'gtk3' 'ffmpeg' 'gawk' 'python2-urllib3' 'xorg-utils')
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

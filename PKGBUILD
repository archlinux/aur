pkgname=python-pafy-git
pkgver=0.5.4.r16.g7c31503
pkgrel=1

pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
url="https://github.com/mps-youtube/pafy"
arch=('any')
license=('LGPL3')

depends=('python' 'youtube-dl')
makedepends=('git')

provides=('python-pafy')
conflicts=('python-pafy')

source=('git+https://github.com/mps-youtube/pafy.git')

md5sums=('SKIP')

pkgver() {
	cd pafy
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
package() {
	cd pafy
	python setup.py install --root="$pkgdir" --optimize=1
}

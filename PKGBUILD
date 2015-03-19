pkgname=python-pafy-git
pkgver=0.3.66.r7.g737aab6
pkgrel=1

pkgdesc="Python API for YouTube - Download videos and retrieve metadata from YouTube."
url="http://np1.github.io/pafy"
arch=('any')
license=('GPL3')

depends=('python')

provides=('python-pafy')
conflicts=('python-pafy')

source=('git+https://github.com/np1/pafy.git')

md5sums=('SKIP')

pkgver() {
	cd pafy
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
package() {
	cd pafy
	python setup.py install --root="$pkgdir" --optimize=1
}

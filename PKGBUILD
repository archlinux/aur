#Maintainer: Gabriel Margiani <gabriel _strange_curved_character_ margiani · ch>
pkgname='python-pathpy-git'
pkgver=r432.fa06dc5
pkgrel=1
pkgdesc="Analysis of time series data on networks with higher- and multi-order graphical models"
arch=('i686' 'x86_64')
url="http://www.pathpy.net"
license=('AGPL')
provides=('python-pathpy')
conflicts=('python-pathpy')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
source=("$pkgname::git+https://github.com/uzhdag/pathpy.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	python setup.py build
}
package() {
	cd $pkgname
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}


# Maintainer: Denis Vadimov <me@bloody.pw>
pkgname=pymobiledevice-git
pkgver=r210.6a02896
pkgrel=1
pkgdesc="Python implementation of libimobiledevice, supporting Apple devices protocols"
arch=('any')
url="https://github.com/iOSForensics/pymobiledevice"
license=('MIT' 'GPL3')
depends=('python-m2crypto'
	 'python-construct>=2.9.29'
	 'python-pyasn1'
	 'python-future'
	 'python-termcolor'
	 'python-click'
	 'python-arrow'
	 'python-coloredlogs'
	 'ipython'
	 'python-bpylist2'
	 'python-pygments'
	 'usbmuxd')
makedepends=('git')
source=("pymobiledevice::git+$url.git#branch=py3")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir"
}

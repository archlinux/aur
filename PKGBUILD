pkgname='python-yappi-hg'
pkgver=312.699a2820b1fc
pkgrel=1
pkgdesc='Yet Another Python Profiler, but this time Thread-Aware'
url='https://code.google.com/p/yappi/'
license=('MIT')
arch=('any')
depends=('python')
makedepends=('mercurial')
source=('hg+https://bitbucket.org/sumerc/yappi')
md5sums=('SKIP')

pkgver() {
	cd yappi
	echo "$(hg identify -n).$(hg identify -i)"
}

package() {
	cd "$srcdir/yappi"
	python setup.py install --root="$pkgdir/" --optimize=1
}

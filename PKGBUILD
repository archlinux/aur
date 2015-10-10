pkgname=termdown-git
pkgver=1.8.0.r2.g05cffef
pkgrel=1

arch=('any')

pkgdesc='Countdown timer and stopwatch in your terminal'
url='https://github.com/trehn/termdown'
license=('GPL3')

depends=('python' 'python-click' 'python-pyfiglet' 'python-dateutil')

source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/"
}

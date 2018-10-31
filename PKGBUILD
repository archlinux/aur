# Maintainer: Jonathan Kohler <kohler.jonathan@gmail.com>
pkgname=python2-labrad-git
pkgver=0.97.2.e9bb3e6
pkgrel=1
pkgdesc="LabRAD is a system for quickly and easily building distributed instrument control and data analysis applications. pylabrad provides a python interface to LabRAD."
arch=("any")
url="https://github.com/labrad/pylabrad"
license=('GPL2')
depends=(
	'python2>=2.7'
	'python2-future'
	'python2-numpy>=1.9.1'
	'python2-configparser'
	'python2-futures>=3.0.4'
	'python2-pyopenssl>=0.13'
	'python2-pyparsing>=2.1.0'
	'python2-requests'
	'python2-service-identity'
	'python2-twisted>=16.0'
)
makedepends=("git")
optdepends=()
source=("$pkgname::git+https://github.com/labrad/pylabrad.git")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python2 setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
    install -D -m644 labrad/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


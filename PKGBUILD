# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python2-bjoern
pkgver=1.4.2
pkgrel=1
pkgdesc="A screamingly fast, ultra-lightweight WSGI server for Python 2, written in C."
arch=("i686" "x86_64")
url="https://github.com/jonashaag/bjoern"
license=("BSD")
depends=("libev" "python2")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/b/bjoern/bjoern-$pkgver.tar.gz")
md5sums=("bd0b1d97a187fd438a8959dfb312683d")

build(){
 cd "$srcdir/bjoern-$pkgver"
 python2 setup.py build
}

package(){
 cd "$srcdir/bjoern-$pkgver"
 python2 setup.py install --skip-build --root="$pkgdir" -O1
 install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"d
} 

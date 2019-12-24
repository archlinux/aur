# Maintainer: 'Sergey Malkin <adresatt@gmail.com>'
pkgname=python-pyabf
_pkgname=pyabf
pkgver=2.2.0
pkgrel=1
pkgdesc="A Python interface to files in the Axon Binary Format (ABF)"
url="https://github.com/swharden/pyABF"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-numpy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/9e/c9/9659548e8760238d45c8790418a5a13cd4b79d9f4496862bf3f25b601d0a/$_pkgname-$pkgver.tar.gz")
sha256sums=('f99ebbba72854c6e678ba1311193b6ea3ba74856115a59bf8eff21cfeab8da82')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py check
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

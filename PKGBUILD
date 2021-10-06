# Maintainer: 'Sergey Malkin <adresatt@gmail.com>'
pkgname=python-pyabf
_pkgname=pyabf
pkgver=2.3.5
pkgrel=1
pkgdesc="A Python interface to files in the Axon Binary Format (ABF)"
url="https://github.com/swharden/pyABF"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-numpy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/a7/7b/374509559942082234c1064fd916ac5829177448113498c1d5e2a93bed73/$_pkgname-$pkgver.tar.gz")
sha256sums=('2bcfd0c658ed02fa26799aa195a543f502ea7f2e8d17d667a8b0a5550111f3f6')

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

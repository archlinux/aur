# Maintainer: 'Sergey Malkin <adresatt@gmail.com>'
pkgname=python-pyabf
_pkgname=pyabf
pkgver=2.2.1
pkgrel=1
pkgdesc="A Python interface to files in the Axon Binary Format (ABF)"
url="https://github.com/swharden/pyABF"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-numpy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/80/b1/35fef1d7f04aa3235ef9e487d4391d325103ba743e47a22cbfaf3a86753d/$_pkgname-$pkgver.tar.gz")
sha256sums=('b49bb767dbc3f3e47d073c3efaca82f1bb69fbfc54982d3375210323cfafd3d4')

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

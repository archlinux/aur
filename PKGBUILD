# Maintainer: 'Sergey Malkin <adresatt@gmail.com>'
pkgname=python-pyabf
_pkgname=pyabf
pkgver=2.2.7
pkgrel=1
pkgdesc="A Python interface to files in the Axon Binary Format (ABF)"
url="https://github.com/swharden/pyABF"
arch=('i686' 'x86_64')
license=('MIT')
depends=('python' 'python-numpy' 'python-matplotlib')
source=("https://files.pythonhosted.org/packages/9a/3b/a71291cae2c10feeee98460d3c3226452eec370781cb6f0c212f4ecdeefc/$_pkgname-$pkgver.tar.gz")
sha256sums=('c1f05492de9c080beecfdd83baf4aea749f78c9fbe927a3149bf0ad7ff4384f1')

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

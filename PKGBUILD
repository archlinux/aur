# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=python-annoy
_pkgname=annoy
pkgver=1.16.3
pkgrel=1
pkgdesc="Approximate Nearest Neighbors in C++/Python optimized for memory usage and loading/saving to disk."
url="https://github.com/spotify/annoy"
arch=('i686' 'x86_64')
license=("Apache") 
depends=('python')
source=("https://files.pythonhosted.org/packages/00/15/5a9db225ebda93a235aebd5e42bbf83ab7035e7e4783c6cb528c635c9afb/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('fe2779664bd8846f2d67191a7e6010b8df890ac4586336748fd0697f31654379')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir/"
}

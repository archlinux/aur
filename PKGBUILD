# Maintainer: Fabio Zanini <fabio.zanini@fastmail.fm>
pkgname=python-annoy
_pkgname=annoy
pkgver=1.17.0
pkgrel=1
pkgdesc="Approximate Nearest Neighbors in C++/Python optimized for memory usage and loading/saving to disk."
url="https://github.com/spotify/annoy"
arch=('i686' 'x86_64')
license=("Apache") 
depends=('python')
source=("https://files.pythonhosted.org/packages/a1/5b/1c22129f608b3f438713b91cd880dc681d747a860afe3e8e0af86e921942/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('9891e264041d1dcf3af42f67fbb16cb273c5404bc8c869d0915a3087f71d58dd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py install --prefix=/usr --root="$pkgdir/"
}

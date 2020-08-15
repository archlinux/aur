#Maintainer: jnanar <info@agayon.be>
_realname=brython
pkgname=python-brython
pkgver=3.8.9
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
options=(!emptydirs)
provides=('python-brython')
source=("https://github.com/brython-dev/brython/archive/${pkgver}.tar.gz")
sha512sums=('f466cfc538b982a59ec7d27153a8d208c7d7c89c0bc8f6a4910b9fbbde668672a0d74a11d4691e3b07997e8cdf2af04197d8829040b59f4ce01cb2116b75a2fb')

package() {
  cd "$srcdir/$_realname-$pkgver/scripts"
  python make_dist.py
  cd "$srcdir/$_realname-$pkgver/setup"
  python setup.py sdist
  python setup.py install --root="$pkgdir/" --optimize=1
}


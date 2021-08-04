#Maintainer: jnanar <info@agayon.be>
_realname=brython
pkgname=python-brython
pkgver=3.9.5
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
options=(!emptydirs)
provides=('python-brython')
source=("https://github.com/brython-dev/brython/archive/${pkgver}.tar.gz")
sha512sums=('eefdfdc159ebf84513a1ede1d91842eb18d168137ca22d3a9ea53f1f488bbf483c312316fb522847d76eb324749723a7983a8abf3295c1144b81029a64da0cef')

package() {
  cd "$srcdir/$_realname-$pkgver/scripts"
  python make_dist.py
  cd "$srcdir/$_realname-$pkgver/setup"
  python setup.py sdist
  python setup.py install --root="$pkgdir/" --optimize=1
}


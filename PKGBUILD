#Maintainer: jnanar <info@agayon.be>
_realname=brython
pkgname=python-brython
pkgver=3.10.4
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
options=(!emptydirs)
provides=('python-brython')
source=("https://github.com/brython-dev/brython/archive/${pkgver}.tar.gz")
sha512sums=('db149a08caa3253caf45615da72b54fb863b1f7a345ec81f9abb1cfcea8931374036a5885bcd0519ff16cd604bdb47c85aab487d57b5bd8b39a9c4675fb351b2')

package() {
  cd "$srcdir/$_realname-$pkgver/scripts"
  python make_dist.py
  cd "$srcdir/$_realname-$pkgver/setup"
  python setup.py sdist
  python setup.py install --root="$pkgdir/" --optimize=1
}


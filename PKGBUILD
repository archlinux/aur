#Maintainer: jnanar <info@agayon.be>
_realname=brython
pkgname=python-brython
pkgver=3.9.0
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
options=(!emptydirs)
provides=('python-brython')
source=("https://github.com/brython-dev/brython/archive/${pkgver}.tar.gz")
sha512sums=('fcacc6f5e959afd2c84980eb0a650028ad018f4ebda05c53ef0a73ef5a8e1b4a28b2940c08f6b5e82bb52975b671610ad47e42de0d6d3030a6b9f5af02784c20')

package() {
  cd "$srcdir/$_realname-$pkgver/scripts"
  python make_dist.py
  cd "$srcdir/$_realname-$pkgver/setup"
  python setup.py sdist
  python setup.py install --root="$pkgdir/" --optimize=1
}


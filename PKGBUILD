#Maintainer: jnanar <info@agayon.be>
_realname=brython
pkgname=python-brython
pkgver=3.11.2
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
options=(!emptydirs)
provides=('python-brython')
source=("https://github.com/brython-dev/brython/archive/${pkgver}.tar.gz")
sha512sums=('1f0d06ae6d6523fb8f99a4ff407783b677063e99f278e1a860a422535695d2f67d98d9ccea02968dd15a52998bd34620dd54f758d5f7f4a4668e9bc621680172')

package() {
  cd "$srcdir/$_realname-$pkgver/scripts"
  python make_dist.py
  cd "$srcdir/$_realname-$pkgver/setup"
  python setup.py sdist
  python setup.py install --root="$pkgdir/" --optimize=1
}


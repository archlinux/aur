pkgname=python-sortedcollections
pkgver=0.5.3
pkgrel=1
pkgdesc="A python library for sorted collections."
arch=('any')
url="http://www.grantjenks.com/docs/sortedcollections/"
license=('Apache-v2')
depends=('python>=3.5' 'python-babel>=2.0' 'python-jinja>=2.8'
    'python-markupsafe>=0.23' 'python-pygments>=2.0.2' 'python-sphinx>=1.3.1'
    'python-sphinx-alabaster-theme>=0.7.6' 'python-docutils>=0.12'
    'python-nose>=1.3.7' 'python-pluggy>=0.3.0' 'python-py>=1.4.30'
    'python-pytz>=2015.4' 'python-six>=1.9.0' 'python-snowballstemmer>=1.2.0'
    'python-sortedcontainers>=0.9.6' 'python-sphinx_rtd_theme>=0.1.8'
    'python-tox>=2.1.1' 'python-virtualenv>=13.1.0' 'python-wsgiref>=0.1.2')
source=(https://codeload.github.com/grantjenks/sortedcollections/tar.gz/v$pkgver)
sha256sums=('0e4158ca2a3ad9f175faf99237fbceaad865cc922847d9cff08c3139b596187e')

package() {
  cd $srcdir/sortedcollections-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}

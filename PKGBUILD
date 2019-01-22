# Maintainer: Amos Onn <amosonn at gmail dot com>
pkgbase=python-sortedcollections
pkgname=('python-sortedcollections' 'python2-sortedcollections')
pkgver=1.1.2
pkgrel=1
pkgdesc="A python library for sorted collections."
arch=('any')
url="http://www.grantjenks.com/docs/sortedcollections/"
license=('Apache-v2')
source=(https://codeload.github.com/grantjenks/sortedcollections/tar.gz/v$pkgver)
sha256sums=('11aee33a812235117c469a970885c2edab3915bae5b65d040b7075aa0a6c4d3f')

prepare() {
  cp -a $pkgbase-$pkgver{,-py2}
}

package_python-sortedcollections() {
  depends=('python' 'python-sortedcontainers>=2.0.0')
  # Other (unnecessary) deps from requirements.txt:
  # 'python-babel>=2.0' 'python-jinja>=2.8' 'python-markupsafe>=0.23'
  # 'python-pygments>=2.0.2' 'python-sphinx>=1.3.1'
  # 'python-sphinx-alabaster-theme>=0.7.6' 'python-docutils>=0.12'
  # 'python-nose>=1.3.7' 'python-pluggy>=0.3.0' 'python-py>=1.4.30'
  # 'python-pytz>=2015.4' 'python-six>=1.9.0' 'python-snowballstemmer>=1.2.0'
  # 'python-sphinx_rtd_theme>=0.1.8' 'python-tox>=2.1.1'
  # 'python-virtualenv>=13.1.0' 'python-wsgiref>=0.1.2')
  cd $srcdir/$pkgbase-$pkgver
  python setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_python2-sortedcollections() {
  depends=('python2' 'python2-sortedcontainers>=2.0.0')
  # Other (unnecessary) deps from requirements.txt:
  # 'python2-babel>=2.0' 'python2-jinja>=2.8' 'python2-markupsafe>=0.23'
  # 'python2-pygments>=2.0.2' 'python2-sphinx>=1.3.1'
  # 'python2-sphinx-alabaster-theme>=0.7.6' 'python2-docutils>=0.12'
  # 'python2-nose>=1.3.7' 'python2-pluggy>=0.3.0' 'python2-py>=1.4.30'
  # 'python2-pytz>=2015.4' 'python2-six>=1.9.0'
  # 'python2-snowballstemmer>=1.2.0' 'python2-sphinx_rtd_theme>=0.1.8'
  # 'python2-tox>=2.1.1' 'python2-virtualenv>=13.1.0' 'python2-wsgiref>=0.1.2')
  cd $srcdir/$pkgbase-$pkgver-py2
  python2 setup.py install --root=$pkgdir || return 1
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/COPYING
}

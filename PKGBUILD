# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=1.4.5
pkgrel=2
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="http://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
options=(!emptydirs)
source=("git+https://github.com/celery/py-amqp.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a py-amqp{,-py2}
}

package_python-amqp() {
  depends=('python')

  cd "$srcdir/py-amqp"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-amqp() {
  depends=('python2')

  cd "$srcdir/py-amqp-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

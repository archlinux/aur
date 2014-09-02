# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-amqp
pkgname=('python-amqp' 'python2-amqp')
pkgver=1.4.6
pkgrel=1
pkgdesc="Low-level AMQP client for Python (fork of amqplib)"
arch=('any')
url="http://github.com/celery/py-amqp"
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'git')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/a/amqp/amqp-$pkgver.tar.gz")
md5sums=('a061581b6864f838bffd62b6a3d0fb9f')

prepare() {
  cp -a amqp-$pkgver{,-py2}
}

package_python-amqp() {
  depends=('python')

  cd amqp-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-amqp() {
  depends=('python2')

  cd amqp-$pkgver-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

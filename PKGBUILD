# Maintainer: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgbase=pyspider
pkgname=(python-${pkgbase} python2-${pkgbase})
pkgver=0.3.10
pkgrel=1
pkgdesc="A Powerful Spider System in Python"
arch=('any')
url="https://github.com/binux/pyspider"
license=('Apache')
source=(${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('4e1918df818aea7e7092ce2f7c785474')

prepare() {
  cp -a "$srcdir/$pkgbase-$pkgver"{,-py2}
}

package_python-pyspider() {
  depends=('python-flask-login' 'python-jinja' 'python-chardet' 'python-cssselect' 'python-lxml' 'python-pyquery' 'python-requests' 'python-tornado' 'python-msgpack' 'python-click' 'python-six' 'python-tblib' 'python-u-msgpack')
  optdepends=('python-mysql-connector' 'python-pika' 'python-pymongo'  'python-sqlalchemy' 'python-amqp' 'python-redis' 'python-kombu' 'python-psycopg2' 'python-elasticsearch')
  cd "$srcdir/$pkgbase-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-pyspider() {
  depends=('python2-flask-login' 'python2-jinja' 'python2-chardet' 'python2-cssselect' 'python2-lxml' 'python2-pyquery' 'python2-requests' 'python2-tornado' 'python2-msgpack' 'python2-click' 'python2-six' 'python2-tblib')
  optdepends=('python2-mysql-connector' 'python2-pika' 'python2-pymongo'  'python2-sqlalchemy' 'python2-amqp' 'python2-redis' 'python2-kombu' 'python2-psycopg2' 'python2-elasticsearch')
  cd "$srcdir/$pkgbase-$pkgver-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  mv "$pkgdir"/usr/bin/pyspider{,2}
}

# vim:set ts=2 sw=2 et:

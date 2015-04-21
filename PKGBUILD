# Maintainer: Aleksey Filippov <sarum9in@gmail.com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname="pika-python3"
pkgname="python-pika"
pkgver=0.9.14
pkgrel=1
pkgdesc="Python 3 fork of Pure Python RabbitMQ/AMQP 0-9-1 client library."
arch=("any")
url="https://github.com/renshawbay/pika-python3"
license=("MPL2")
depends=("python")
options=("!emptydirs")
source=("https://github.com/renshawbay/pika-python3/archive/$pkgver.tar.gz")
sha1sums=('5d7c5fdc4791ef25b884d087a402a264c8db3631')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

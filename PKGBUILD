# Maintainer: 

_pkgbase=amqpstorm
pkgname=python-$(echo "$_pkgbase" | tr '[:upper:]' '[:lower:]')
pkgver=2.9.0
pkgrel=1
pkgdesc="Thread-safe Python RabbitMQ Client & Management library."
arch=('any')
url="https://www.amqpstorm.io/"
license=('MIT License)')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/eandersson/amqpstorm/archive/refs/tags/${pkgver}.zip")

build() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
sha256sums=('f627c2785855940a744fcaee0328126fd471c4e2e2ce89e5ee9f27d0014744d6')

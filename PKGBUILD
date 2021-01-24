# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=litex-boards
pkgname=python-$_pkgname
pkgver=2020.12
pkgrel=1
pkgdesc='Small footprint and configurable Ethernet core'
arch=('any')
url="https://github.com/litex-hub/$_pkgname"
license=('BSD')
depends=('python-migen' 'python-litex' 'python-litedram' 'python-liteeth' 'python-liteiclink' 'python-litejesd204b'
         'python-litepcie' 'python-litesata' 'python-litescope' 'python-litesdcard' 'python-litevideo')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('f360f9e0ea30002586433721afb8cd38a4839b8445121ec24323ad79fd8f02ce064012c8138f9fe458c16741859e4e9059bcece49af384b1ed3979a2116bec70')

build() {
  cd $_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

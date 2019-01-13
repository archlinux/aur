# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-colorspacious
pkgver=1.1.2
pkgrel=1
pkgdesc='A powerful, accurate, and easy-to-use Python library for doing colorspace conversions'
url='http://colorspacious.readthedocs.org/en/latest/'
depends=('python-numpy')
license=('MIT')
arch=('any')
source=("https://github.com/njsmith/colorspacious/archive/v$pkgver.tar.gz"
        'LICENSE')
md5sums=('6736faaad92c6c75931fb34d86767d11'
         '032f6276b1a63e4062c163daae656d61')

build() {
  cd colorspacious-"$pkgver"
  python setup.py build
}

package() {
  cd colorspacious-"$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 
  install -D -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

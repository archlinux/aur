# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=tekaim
pkgver=1.5.0
pkgrel=1
pkgdesc='A simple tool to take and upload screenshots to teknik.io'
arch=(any)
url='https://github.com/IvanFon/tekaim'
license=(GPL3)
depends=('python' 'curl' 'xclip')

source=(https://github.com/IvanFon/tekaim/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('e5a2af6d1838860f301ced56b8d0c6ded94c75ae727ecd4d8fe742ea5bb80367')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Create tekaim directory if it doesn't exist
  [ -d ~/.tekaim ] || mkdir ~/.tekaim
  # Copy config
  cp config.json ~/.tekaim/
  # Install tekaim
  python setup.py install --root="$pkgdir/" --optimize=1
}


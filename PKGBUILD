# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=tekaim
pkgver=1.2.0
pkgrel=2
pkgdesc='A simple tool to take and upload screenshots to teknik.io'
arch=(any)
url='https://github.com/IvanFon/tekaim'
license=(GPL3)
depends=('python' 'curl' 'xclip')

source=(https://github.com/IvanFon/tekaim/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('d67a9a5f7f689e6d0a2524c623f929c40c0e5a9231e7d184acab5c49bbae6a8c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Create tekaim directory if it doesn't exist
  [ -d ~/.tekaim ] || mkdir ~/.tekaim
  # Copy config
  cp config.json ~/.tekaim/
  # Install tekaim
  python setup.py install --root="$pkgdir/" --optimize=1
}


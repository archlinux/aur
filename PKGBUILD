# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=tekaim
pkgver=1.4.0
pkgrel=1
pkgdesc='A simple tool to take and upload screenshots to teknik.io'
arch=(any)
url='https://github.com/IvanFon/tekaim'
license=(GPL3)
depends=('python' 'curl' 'xclip')

source=(https://github.com/IvanFon/tekaim/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('5e56eed1e561df7fe602f324c33734998ea094b05a0bb2358f46c227003397f3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # Create tekaim directory if it doesn't exist
  [ -d ~/.tekaim ] || mkdir ~/.tekaim
  # Copy config
  cp config.json ~/.tekaim/
  # Install tekaim
  python setup.py install --root="$pkgdir/" --optimize=1
}


# Maintainer: Your Name <your@email.com>
pkgname=py-fetch
pkgver=1.1.0
pkgrel=1
pkgdesc="A FastFetch-like system information tool written in Python with customizable ASCII art"
arch=('any')
url="https://github.com/binarylinuxx/pyfetch"
license=('GPL3')
depends=('python' 'python-psutil' 'python-colorama')
makedepends=('git' 'python-psutil' 'python-colorama' 'python')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pyfetch"  # Changed from $pkgname to match actual directory
  install -Dm755 pyfetch "$pkgdir/usr/bin/pyfetch"
  install -Dm644 config.ini "$pkgdir/etc/pyfetch/config.ini"
  install -Dm644 config.ini "$pkgdir/usr/share/doc/pyfetch/config.ini.example"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  echo "Place your custom config in ~/.config/pyfetch/config.ini" > "$pkgdir/usr/share/doc/pyfetch/README"
}

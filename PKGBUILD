# Maintainer: Your Name <your@email.com>
pkgname=py-fetch
pkgver=1.2.0
pkgrel=1
pkgdesc="An independent python-system-information-tool written in Python with customizable ASCII art"
arch=('any')
url="https://github.com/binarylinuxx/pyfetch"
license=('GPL3')
depends=('python' 'python-psutil' 'python-colorama')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/pyfetch"
  
  # Main executable
  install -Dm755 pyfetch "$pkgdir/usr/bin/pyfetch"
  
  # Config files (use .pacnew to avoid conflicts)
  install -Dm644 config.ini "$pkgdir/etc/pyfetch/config.ini.pacnew"
  install -Dm644 config.ini "$pkgdir/usr/share/doc/pyfetch/config.ini.example"
  
  # Documentation
  echo "Place your custom config in ~/.config/pyfetch/config.ini" > "$pkgdir/usr/share/doc/pyfetch/README"
  
  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

pkgname=wolfbrowser
pkgver=0.5.02
pkgrel=1
pkgdesc="Web browser on python and PyQt6. With this browser you can save you data."
arch=('any')
url="https://codeberg.org/int13h3/Wolf_browser/src/branch/main/Wolf_browser_0.5.02.tar.xz"
license=('GPL3')
depends=('bash' 'python' 'python-pyqt6' 'python-pyqt6-webengine')
makedepends=('git')
source=('Wolf_browser_0.5.02.tar.xz::https://codeberg.org/int13h3/Wolf_browser/raw/branch/main/Wolf_browser_0.5.02.tar.xz')
sha256sums=('SKIP')
package() {
  cd "$srcdir/Wolf_browser"

  mkdir -p "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname/"

  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/bash
cd /usr/lib/$pkgname && python browser.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}

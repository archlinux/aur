pkgname=wolfbrowser
pkgver=0.3.01
pkgrel=1
pkgdesc="Web browser on python and PyQt6. With this browser you can save you data."
arch=('any')
url="https://codeberg.org/int13h3/Wolf_browser/src/branch/main/Wolf_browser_0.3.01.tar.xz"
license=('GPL3')
depends=('bash' 'python')
makedepends=('git')
source=('https://codeberg.org/int13h3/Wolf_browser/src/branch/main/Wolf_browser_0.3.01.tar.xz')
sha256sums=('SKIP')
package() {
  cd "$srcdir/Wolf_browser"
  mkdir -p "$pkgdir/usr/lib/Wolf_browser"
  cp browser.py "$pkgdir/usr/lib/Wolf_browser/"
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/Wolf_browser" << EOF
#!/bin/bash
python /usr/lib/$pkgname/browser.py
EOF
  chmod 755 "$pkgdir/usr/bin/$pkgname"
}

pkgname=tb-tdl
pkgver=0.3.0
pkgrel=1
pkgdesc="Terminal based to-do list"
arch=('any')
url="https://github.com/nicitel3333/tb-tdl"
license=('MIT')
depends=('python' 'python-pipx')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

depends=('python' 'python-textual')

package() {
  cd "$srcdir/tb-tdl-$pkgver"
  install -Dm755 main.py "$pkgdir/usr/lib/tb-tdl/main.py"
  cp -r src "$pkgdir/usr/lib/tb-tdl/src"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/tdl" <<EOF
#!/bin/bash
cd /usr/lib/tb-tdl
exec python main.py
EOF
}

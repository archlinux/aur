pkgname=rovibe
pkgver=0.1.1
pkgrel=1
pkgdesc='OS-level identity and permission isolation for AI coding agents'
arch=(any)
url='https://github.com/knowlen/rovibe'
license=(WTFPL)
depends=(bash git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/knowlen/rovibe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c0c6af306c2edef6c86a6fb5e936170e76534e3fede42d3ac4a2db917b0dc14a')
install=rovibe.install

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 rovibe "$pkgdir/usr/local/bin/rovibe"
  install -dm755 "$pkgdir/usr/local/lib/rovibe"
  for f in lib/*; do
    install -Dm755 "$f" "$pkgdir/usr/local/lib/rovibe/$(basename "$f")"
  done
}

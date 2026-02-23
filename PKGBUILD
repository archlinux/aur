pkgname=rovibe
pkgver=0.1.1
pkgrel=1
pkgdesc='OS-level identity and permission isolation for AI coding agents'
arch=(any)
url='https://github.com/knowlen/rovibe'
license=(WTFPL)
depends=(bash git)
source=("$pkgname-$pkgver.tar.gz::https://github.com/knowlen/rovibe/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fbbdca50a406f43771acedd45b7b2102925cd09174be0ca92bcd04c4f8cd7b51')
install=rovibe.install

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 rovibe "$pkgdir/usr/local/bin/rovibe"
  install -dm755 "$pkgdir/usr/local/lib/rovibe"
  for f in lib/*; do
    install -Dm755 "$f" "$pkgdir/usr/local/lib/rovibe/$(basename "$f")"
  done
}

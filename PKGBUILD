# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Łukasz Moroz <lukaszmoroz@gmail.com>
pkgname=nautilus-copy-path
pkgver=1.4
pkgrel=1
pkgdesc="Configurable extension for Nautilus to copy path, URI, or name"
arch=('any')
url="https://github.com/Xarianne/nautilus-copy-path"
license=('MIT')
depends=(
  'nautilus-python'
  'python-gobject'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('129768ef0b11b772a376d6e9f6d94b9529fac4c8069fbeda8c8c1329e88ef330')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 $pkgname.py -t "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 nautilus_copy_path.py config.json translation.py -t \
    "$pkgdir/usr/share/nautilus-python/extensions/$pkgname/"
  install -Dm644 translations/*.json -t \
    "$pkgdir/usr/share/nautilus-python/extensions/$pkgname/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Łukasz Moroz <lukaszmoroz@gmail.com>
pkgname=nautilus-copy-path
pkgver=1.3
pkgrel=2
pkgdesc="Configurable extension for Nautilus to copy path, URI, or name"
arch=('any')
url="https://github.com/xariann-pkg/nautilus-copy-path"
license=('MIT')
depends=(
  'nautilus-python'
  'python-gobject'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1fc4fb5a3922fde76fa61ed154e342427a281ae6dbe399f5362725e317132e8f')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 $pkgname.py -t "$pkgdir/usr/share/nautilus-python/extensions/"
  install -Dm644 nautilus_copy_path.py config.json translation.py -t \
    "$pkgdir/usr/share/nautilus-python/extensions/$pkgname/"
  install -Dm644 translations/*.json -t \
    "$pkgdir/usr/share/nautilus-python/extensions/$pkgname/translations/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

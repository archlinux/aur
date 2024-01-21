# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=nautilus-mediainfo
pkgver=1.0.4
pkgrel=3
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nautilus-mediainfo"
license=('GPL-3.0-or-later')
depends=('python-mediainfodll' 'python-nautilus<4.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('af0d6aba5e12c0e6c680e773e24d41711c6233fe9c84fe4586b997a78c9984c1')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "nautilus-extension/$pkgname.py" -t \
    "$pkgdir/usr/share/nautilus-python/extensions"
  install -d "$pkgdir/usr/share/nautilus-python/extensions/$pkgname"
  cp -a "nautilus-extension/$pkgname/locale/." \
    "$pkgdir/usr/share/nautilus-python/extensions/$pkgname/locale"
}

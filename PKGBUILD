# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Corax <cor dot ax26 at gmail dot com>
pkgname=nemo-mediainfo-tab
pkgver=1.0.4
pkgrel=2
pkgdesc="View media information from the properties tab"
arch=('any')
url="https://github.com/linux-man/nemo-mediainfo-tab"
license=('GPL-3.0-or-later')
depends=('python-mediainfodll' 'nemo-python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linux-man/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3518eb1a1caae4ca2fb58d9ceb65a3363a17839ab5cb1ae2ee5b6b05abe7ec56')

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 "nemo-extension/$pkgname.py" \
    "$pkgdir/usr/share/nemo-python/extensions/$pkgname.py"
  install -d "$pkgdir/usr/share/nemo-python/extensions/$pkgname"
  cp -a "nemo-extension/$pkgname/locale" \
    "$pkgdir/usr/share/nemo-python/extensions/$pkgname/locale"
}

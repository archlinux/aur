# Maintainer: Racks Rask <archlinux@raskinthewild.com>

pkgname=asngecko
pkgver=1.2.0
pkgrel=2
pkgdesc="Advanced swiss-army tool for resolving ASN IPv4 / IPv6 prefixes."
arch=('any')
url="https://github.com/furrofurry/asngecko"
license=('MIT')
depends=('bash' 'coreutils' 'grep' 'awk' 'whois')
optdepends=('jq: pretty JSON output')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('87b7831346e28a51042421d72dfd0c30d71f9d1af240d86e463fc462948ba64a')

package() {
  install -Dm755 "$pkgname-$pkgver/$pkgname" \
    "$pkgdir/usr/bin/$pkgname"

  # helper scripts
  install -Dm755 "$pkgname-$pkgver/install.sh" \
    "$pkgdir/usr/share/$pkgname/install.sh"
  install -Dm755 "$pkgname-$pkgver/uninstall.sh" \
    "$pkgdir/usr/share/$pkgname/uninstall.sh"

  install -Dm644 "$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

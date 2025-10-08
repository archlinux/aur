# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=simple-system-update
pkgver=1.0.12
pkgrel=1
pkgdesc="One-click update button for Linux users"
arch=('any')
url="https://github.com/SeryogaBrigada/SimpleSystemUpdate"
license=('MIT')
depends=('grep'
         'sed'
         'jq'
         'wget')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/SimpleSystemUpdate/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('07641d184e5cbec8f5f7678aa4073053ee3491bd89867b758aa8c52c29ce7b98825d8e6da20b8e626a44113af070feeaecdfc03c10c726fda989b21743fedbd6')

package() {
  cd "SimpleSystemUpdate-$pkgver"

  # Install files
  install -Dm755 simple-system-update "$pkgdir/usr/bin/simple-system-update"
  install -Dm644 com.github.seryogabrigada.SimpleSystemUpdate.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.SimpleSystemUpdate.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

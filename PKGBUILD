# Maintainer: Sergey Kovalenko <seryoga.engineering@gmail.com>

pkgname=simple-system-update
pkgver=1.0.8
pkgrel=3
pkgdesc="One-click update button for Linux users"
arch=('any')
url="https://github.com/SeryogaBrigada/SimpleSystemUpdate"
license=('MIT')
depends=('grep'
         'sed'
         'curl'
         'jq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/SeryogaBrigada/SimpleSystemUpdate/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('ed26288a97b76806697440a4133cbefee48b47dae305eebb100b0f8109a3c52951ebb25265d2991862f80178cf4df45108820561503dd10f6a92c66dd3846233')

package() {
  cd "SimpleSystemUpdate-$pkgver"

  # Install files
  install -Dm755 simple-system-update "$pkgdir/usr/bin/simple-system-update"
  install -Dm644 com.github.seryogabrigada.SimpleSystemUpdate.desktop "$pkgdir/usr/share/applications/com.github.seryogabrigada.SimpleSystemUpdate.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: GP Team <omardev120@gmail.com>
pkgname=apkg
pkgver=0.1.0
pkgrel=1
pkgdesc="APKG — GP Team’s Unified Package Manager (unified CLI for apt, pacman, dnf, yum, zypper, apk)"
arch=('any')
url="https://github.com/gpteamofficial/apkg"
license=('GPL3')
depends=('bash')
source=(
  "apkg::https://raw.githubusercontent.com/gpteamofficial/apkg/main/apkg"
  "LICENSE::https://raw.githubusercontent.com/gpteamofficial/apkg/main/LICENSE"
  "README.md::https://raw.githubusercontent.com/gpteamofficial/apkg/main/README.md"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
  cd "$srcdir"

  # السكربت الرئيسي يتحط في /usr/bin/apkg
  install -Dm755 "apkg" "$pkgdir/usr/bin/apkg"

  # ترخيص GPLv3
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # README كدوكيومنتيشن
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# Maintainer: Daniël Nazarkin <aur@danicatgames.nl>

pkgname=lore-server-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Server for the lore version control system from Epic Games"
url="https://github.com/EpicGames/lore"
license=('MIT')
depends=('glibc' 'libgcc')
arch=('x86_64')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/EpicGames/lore/releases/download/v${pkgver}/loreserver-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('42bce4124d07642e0eb1c996d6262889760b142992d0ed0f6054d0968bc9efc1')

package() {
  install -Dm755 "$srcdir/loreserver" "$pkgdir/usr/bin/loreserver"
  install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/THIRD-PARTY-NOTICES.txt" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES"
}

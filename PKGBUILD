# Maintainer: Alexander Shibaev <sashashibaev@gmail.com>
pkgname=sang
pkgver=0.0.3
pkgrel=1
pkgdesc="Sang is not GRUB"
arch=('any')
url="https://github.com/woowgers/sang"
license=('WTFPL')
depends=('polkit' 'systemd' 'efibootmgr' 'nushell' 'zenity')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/woowgers/sang/archive/$pkgver.tar.gz")
sha256sums=('9f0eb2487f2515afc91cde2689565006daa1ab88bafbe527afe34143f6ac0d4e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 bin/sang "$pkgdir/usr/bin/sang"
  install -Dm644 sang.nu "$pkgdir/usr/share/sang/sang.nu"
  install -Dm644 misc/sang.desktop "$pkgdir/usr/share/applications/sang.desktop"

  for size in 16 32 48 64 128 256 512; do
    install -Dm644 icons/sang-boot-${size}.png \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/sang.png"
  done
}

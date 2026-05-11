# Maintainer: Alexander Shibaev <sashashibaev@gmail.com>
pkgname=sang
pkgver=0.0.4
pkgrel=1
pkgdesc="Sang is not GRUB"
arch=('any')
url="https://github.com/woowgers/sang"
license=('WTFPL')
depends=('polkit' 'systemd' 'efibootmgr' 'nushell' 'zenity' 'jq' 'jc')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/woowgers/sang/archive/$pkgver.tar.gz")
sha256sums=('958dd02aaa07ff404ac184a1a248710fb585b7666e30b120460dd206dd3efa12')

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

# Maintainer: Jerry Reinoehl <jerryreinoehl@gmail.com>
pkgname=mkinitcpio-message
pkgver=1.0.0
pkgrel=1
pkgdesc="mkinitcpio hook to display a message"
arch=(any)
url="https://github.com/jerryreinoehl/mkinitcpio-message"
license=('GPL')
install=mkinitcpio-message.install
depends=(mkinitcpio)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jerryreinoehl/mkinitcpio-message/archive/v${pkgver}.tar.gz")
sha256sums=(c8d8727c31c2fed78326983804fce989ceecf67c8d14965981965224538dfc2d)

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -D -m 0644 \
    "install/message" \
    "$pkgdir/usr/lib/initcpio/install/message"

  install -D -m 0644 \
    "hooks/message" \
    "$pkgdir/usr/lib/initcpio/hooks/message"
}

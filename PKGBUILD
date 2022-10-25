# Maintainer: Your Name <youremail@domain.com>
pkgname=random_machine_id
pkgver=1
pkgrel=1
pkgdesc="generate new /etc/machine-id on boot"
arch=(any)
url=""
license=('GPL')
depends=(systemd)

package() {
  install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname.sh"
  install -Dm0644 "../$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service" 

  echo "enable service via #systemctl enable --now random_machine_id.service"
}

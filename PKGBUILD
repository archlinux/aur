# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=ansible-pacman_key
pkgver=1.0.0
pkgrel=2
pkgdesc="Ansible module to manage pacman's list of trusted keys"
arch=(any)
url="https://github.com/grawlinson/ansible-pacman_key"
license=('GPL')
depends=(ansible)
source=("$pkgname-$pkgver.tar.gz::https://github.com/grawlinson/$pkgname/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://github.com/grawlinson/$pkgname/releases/download/$pkgver/$pkgver.tar.gz.asc")
sha512sums=('b94f56b6f4389b7b09e5d058fdf67bd63ed16ffe1b3f3c6ee09875cb3dd9a52affff8c16b1656a8d6d0edf3fc8c6fd339e261f9806a5bc0f083d1e5fedd24921'
            'SKIP')
validpgpkeys=(034D823DA2055BEE6A6BF0BB25EA6900D9EA5EBC) # George Rawlinson <george@rawlinson.net.nz>

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/ansible/plugins/modules" pacman_key.py
}

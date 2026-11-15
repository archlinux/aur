# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="A minimal AUR helper written in Rust"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git' 'sudo' 'util-linux')
conflicts=('rauri')
provides=('rauri')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/ognrdrch/rauri/releases/download/v${pkgver}/rauri-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('4ef0a66aa28ae559228475e0cf79dad06ac815b2c7986434b52a9cd6af312ff7')

package() {
  cd "$srcdir"
  
  # Install binary
  install -Dm755 rauri "$pkgdir/usr/bin/rauri"
  
  # Install license if present
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}


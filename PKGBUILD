# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A minimal AUR helper written in Rust"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git' 'sudo' 'util-linux')
conflicts=('rauri')
provides=('rauri')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/ognrdrch/rauri/releases/download/v${pkgver}/rauri-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('6db0e35b0ae5f1a4abfde4dc7fd01ffff9848fd83fe74fdcb0b0977075222dba')

package() {
  cd "$srcdir"
  
  # Install binary
  install -Dm755 rauri "$pkgdir/usr/bin/rauri"
  
  # Install license if present
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}


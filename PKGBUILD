# Maintainer: ognrdrch <https://github.com/ognrdrch>
pkgname=rauri-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="A minimal AUR helper for written in Rust"
arch=('x86_64')
url="https://github.com/ognrdrch/rauri"
license=('MIT')
depends=('pacman' 'git')
conflicts=('rauri')
provides=('rauri')
source_x86_64=("${pkgname}-${pkgver}.tar.gz::https://github.com/ognrdrch/rauri/releases/download/v${pkgver}/rauri-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('c670b40456e1afc994902d60749af3adc7cf8368a51f6080ef1f262079077a1a')

package() {
  cd "$srcdir"
  
  # Install binary
  install -Dm755 rauri "$pkgdir/usr/bin/rauri"
  
  # Install license if present
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}


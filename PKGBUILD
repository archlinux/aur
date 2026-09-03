# Maintainer: tsaitang <tsaitang404@gmail.com>
pkgname=new-api-bin
pkgver=1.0.0.rc.31
pkgrel=1
pkgdesc='OpenAI API management and distribution'
arch=('x86_64')
url='https://github.com/QuantumNous/new-api'
license=('MIT')
depends=()
backup=('etc/new-api/.env')
_upver=1.0.0-rc.31
source=("https://github.com/QuantumNous/new-api/releases/download/v${_upver}/new-api-v${_upver}")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/new-api-v${_upver}" "$pkgdir/usr/bin/new-api"
  install -dm755 "$pkgdir/etc/new-api"
  echo "PORT=3000" > "$pkgdir/etc/new-api/.env"
  echo "SESSION_SECRET=$(openssl rand -hex 24)" >> "$pkgdir/etc/new-api/.env"
  echo "TZ=Asia/Shanghai" >> "$pkgdir/etc/new-api/.env"
}

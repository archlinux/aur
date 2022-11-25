# Maintainer: Gerardo Gomez <gerardo.gomez@tutanota.com>

pkgname=docker-compose-v2-bin
pkgver=2.12.1
pkgrel=1
pkgdesc="Standalone Golang-based package of a tool for running multi-container applications on Docker defined using the Compose file format"
depends=()
arch=('x86_64')
conflicts=('docker-compose')
provides=('docker-compose')
options=(!strip)
source=(
  "docker-compose-v$pkgver::https://github.com/docker/compose/releases/download/v$pkgver/docker-compose-linux-x86_64"
  "https://github.com/docker/compose/archive/v$pkgver.tar.gz"
)
url="https://github.com/docker/compose"
license=("Apache")
sha256sums=('943ff254867e1c23cd6414d7255790daddc7ab69013dd79ba5c172410cbafb14'
            'b24ca9b04ad511412af6595a7c3d6a3c119c920b7429545b4e6f70be07523007')

package() {
  cd "$srcdir"
  install -Dm755 "docker-compose-v$pkgver" "$pkgdir/usr/bin/docker-compose"

  cd "$srcdir/compose-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

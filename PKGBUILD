# Maintainer: Finn <finn-ja@gmx.de>

pkgname=commiefetch
pkgver=1.0
pkgrel=1
pkgdesc="Systeminfo-Tool mit kommunistischem ASCII-Logo, Bash-Integration und versteckten Anzeigemodi"
arch=('x86_64')
url="https://gitlab.com/arch1380517/commiefetch"
license=('CPL1')
depends=()
makedepends=('gcc' 'make')
source=("https://gitlab.com/arch1380517/commiefetch/-/archive/v${pkgver}/commiefetch-v${pkgver}.tar.gz")
sha256sums=('363dc1d2991113ac68a7792c57f5567df378e2ab3b320494152d02b1a8a08181')

build() {
  cd "commiefetch-v${pkgver}"
  make
}

package() {
  cd "commiefetch-v${pkgver}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  if [ -f LICENSE.md ]; then
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  fi
}

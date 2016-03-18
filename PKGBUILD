# Maintainer: Dennis Hamester <dennis.hamester@startmail.com>

_commit='dd5540ff51694cdae18800219e00791c674bde4e'
pkgname=dotrix
pkgver=0.1.1
pkgrel=1
pkgdesc="The pedantic dotfiles manager"
arch=(i686 x86_64)
url="https://gitlab.com/dennis-hamester/dotrix"
license=('custom:ISC')
makedepends=('rust' 'cargo')
source=("dotrix-v$pkgver.tar.gz::https://gitlab.com/dennis-hamester/dotrix/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('36283425909b083a2b6fbaba04710506c9e3c6f69ce1a465e1bfcd534171a041')

build() {
  cd ${pkgname}-v${pkgver}-${_commit}
  cargo build --release
}

package() {
  cd ${pkgname}-v${pkgver}-${_commit}
  install -Dm755 target/release/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

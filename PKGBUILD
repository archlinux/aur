# Maintiner: Ilya Zlobintsev <ilya.zlve@gmail.com>
pkgname=borealis-git
pkgver=r.
pkgrel=1
pkgdesc="Asus Aura Sync driver application for Linux"
url="https://github.com/Philpax/borealis"
arch=('any')
licence=('MIT')
depends=()
makedepends=('rust')
source=('git://github.com/Philpax/borealis.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd borealis
    cargo build --release
}

package() {
    cd borealis
    install -Dm755 target/release/borealis "$pkgdir/usr/bin/borealis"
}

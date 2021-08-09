# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill
pkgver=0.9.0
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/krill/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a829458fbfa2690a89b74e13a9fc34629a9544f2d6b1ae13b0a520039a4a2906')


check() {
  cd "krill-$pkgver"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "krill-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/krill-$pkgver"
}

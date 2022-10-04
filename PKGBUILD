# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill
pkgver=0.11.0
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/krill/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('319323c547008aa10660c3ca18f6703d6dc90822930ca39157ba5e12f0ade23c')


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

# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nlnetlabs-krill
pkgver=0.8.1
pkgrel=1
pkgdesc="RPKI certificate authority and publication server"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/about/"
license=('MPL2')
depends=('gcc-libs' 'openssl')
makedepends=('git' 'rust')
source=("git+https://github.com/NLnetLabs/krill.git#tag=v$pkgver")
sha256sums=('SKIP')


check() {
  cd "krill"

  #cargo test \
  #  --locked \
  #  --release
}

package() {
  cd "krill"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/krill"
}

# Maintainer: Yurii Vlasov <yuriy@vlasov.pro>
pkgname=dm-nuke
pkgver=1.0.0
pkgrel=1
pkgdesc="Decrypt smart nuke mkinitcpio hook"
arch=('x86_64' 'aarch64')
url="https://vlasov.pro/ru/p/dm-crypt-nuke/"
license=('Apache Licence 2.0')
depends=('mkinitcpio' 'whois' 'coreutils' 'cryptsetup')
makedepends=('findutils' 'coreutils')
source=('src.tar.gz')
noextract=()

prepare() {
  tar -xpzf src.tar.gz
}

package() {
  find "$srcdir" -mindepth 1 -type f -print0 | \
  xargs -0n1 realpath --relative-to="$srcdir" | \
  xargs -I% install -D % "$pkgdir/%"
}
sha256sums=('50e6302d7358b55a86abb921814fef78145f2fb82ed36232dbcb21747d53a1ac')

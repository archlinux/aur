# Maintainer: ilovemikael <itsmeguys2247 at gmail dot com>

# PKGBUILD forked from doas-sudo-shim [https://aur.archlinux.org/packages/doas-sudo-shim] by
# Maintainer: Jakub Jirutka <jakub@jirutka.cz>
_pkgname=doas-sudo-shim
pkgname=doas-sudo-shim-k
pkgver=0.1.2.1k
pkgrel=1
pkgdesc="Wrapper for sudo which utilizes doas (includes -k flag to ensure makepkg compatibility)"
arch=(any)
url="https://github.com/fclivaz42/doas-sudo-shim"
license=(ISC)
provides=(sudo)
conflicts=(sudo doas-sudo-shim)
depends=(awk doas sh)
makedepends=(asciidoctor)
source=("$_pkgname-$pkgver.tar.gz::https://github.com/mckaygerhard/doas-sudo-shim/archive/refs/heads/fclivaz42-master.zip")
sha256sums=('c991cbbe197e9018dc0d80e1ea0a7ecfa2920d8f748751d53d22f7ba21ea10c0')

build() {
  cd doas-sudo-shim-fclivaz42-master 
  make man
}

package() {
  cd doas-sudo-shim-fclivaz42-master
  make install DESTDIR="$pkgdir" PREFIX=/usr
}

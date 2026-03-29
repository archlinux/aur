# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164,SC2154

pkgname=lando-bin
pkgver=3.26.2
pkgrel=2
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose' 'libxcrypt-compat')
source_x86_64=("$pkgname-$pkgver::https://github.com/lando/core/releases/download/v$pkgver/lando-linux-x64-v$pkgver")
sha256sums_x86_64=('06809a475eaaf6076dca302f9f746377616f76c0c979099f2b6e6b1384f6b0a3')
install=$pkgname.install
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

package(){
    install -D -m 755 "$srcdir/lando-bin-$pkgver" "$pkgdir/usr/bin/lando"
}

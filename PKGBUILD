# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164,SC2154

pkgname=lando-bin
pkgver=3.17.1
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose' 'libxcrypt-compat')
source_x86_64=("$pkgname-$pkgver.pacman::https://github.com/lando/lando/releases/download/v$pkgver/lando-x64-v$pkgver.pacman")
sha256sums_x86_64=('8c14362741c31a076f58a1df60cf2c4426bf5df8dbd1404733cbdaa8ec78ba94')
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

package(){
    mkdir -p "$pkgdir"/usr/share/lando
    cp -r "$srcdir"/usr/share/lando/bin "$pkgdir"/usr/share/lando/bin
    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/share/lando/bin/lando "$pkgdir"/usr/bin/lando
}

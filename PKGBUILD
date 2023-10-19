# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164,SC2154

pkgname=lando-bin
pkgver=3.20.4
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose' 'libxcrypt-compat')
source_x86_64=("$pkgname-$pkgver.pacman::https://github.com/lando/lando/releases/download/v$pkgver/lando-x64-v$pkgver.pacman")
sha256sums_x86_64=('b94e16b996224ff799bdbfaef095ee7cbc063cbcaf0ef44974a72ec70c4c5ef3')
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

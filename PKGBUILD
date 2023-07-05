# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164,SC2154

pkgname=lando-bin
pkgver=3.18.0
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose' 'libxcrypt-compat')
source_x86_64=("$pkgname-$pkgver.pacman::https://github.com/lando/lando/releases/download/v$pkgver/lando-x64-v$pkgver.pacman")
sha256sums_x86_64=('712a1cdabf9ce800c85802ef25741764c48a14b611c719a34c623e596ae811e9')
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

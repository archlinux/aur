# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164,SC2154

pkgname=lando-bin
pkgver=3.11.0
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose' 'libxcrypt-compat')
source_x86_64=("$pkgname-$pkgver.deb::https://github.com/lando/lando/releases/download/v$pkgver/lando-x64-v$pkgver.deb")
sha256sums_x86_64=('feb4e00bac3493e92d9b4f49392eb6d22637bf3689a4adea6123a0fb148f3b2a')
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

package(){
    # Extract package data
    tar xf data.tar.gz -C "${pkgdir}"

    # Symlink important binary files
    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/share/lando/bin/lando "$pkgdir"/usr/bin/lando

    # For .desktop file (doesn't appear to be working)
    #mkdir -p "$pkgdir"/usr/share/lando
    #ln -s /usr/share/lando/bin/lando "$pkgdir"/usr/share/lando/Lando
    #mkdir -p "$pkgdir"/usr/share/pixmaps
    #ln -s /usr/share/lando/bin/lando.png "$pkgdir"/usr/share/pixmaps/lando.png
}

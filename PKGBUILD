# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164,SC2154

pkgname=lando-bin
pkgver=3.21.2
pkgrel=1
pkgdesc="A free, open source, cross-platform, local development environment and DevOps tool built on Docker container technology"
arch=('x86_64')
url="https://docs.lando.dev/"
license=('GPL')
depends=('docker' 'docker-compose' 'libxcrypt-compat')
source_x86_64=("$pkgname-$pkgver::https://github.com/lando/cli/releases/download/v$pkgver/lando-linux-x64-v$pkgver")
sha256sums_x86_64=('934bbfa2bddd48e0ac09eeebf94b1c7677645b0c7ffa8af601c68da2c3633d5d')
install=$pkgname.install
conflicts=("lando")
provides=("lando")

# strip breaks executable
options=(!strip)

package(){
    mkdir -p "$pkgdir"/usr/share/lando/bin
    cp "$srcdir"/lando-bin-"$pkgver" "$pkgdir"/usr/share/lando/bin/lando
    chmod a+x "$pkgdir"/usr/share/lando/bin/lando
    mkdir -p "$pkgdir"/usr/bin
    ln -s /usr/share/lando/bin/lando "$pkgdir"/usr/bin/lando
}

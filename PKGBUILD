# Maintainer: diced <pranaco2@gmail.com>
pkgname='dvm-git'
pkgver=1.1.7
pkgrel=1
makedepends=('rust' 'cargo')
conflicts=('discord' 'discord-canary' 'discord-ptb' 'discord-development')
arch=('x86_64')
pkgdesc="discord version manager for linux"
url="https://github.com/diced/dvm"
source=('git+https://github.com/diced/dvm.git#branch=trunk')
sha256sums=('SKIP')
license=('MIT')


build() {
  cd "$srcdir/dvm" || exit 1

  cargo build --release
}

package() {
    cd "$srcdir/dvm" || exit 1
    
    install -D -o root -g root -m 755 target/release/dvm "$pkgdir/usr/bin/dvm"
}


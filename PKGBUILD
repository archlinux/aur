# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=netop
pkgver=0.1.4
pkgrel=1
depends=('libpcap' 'glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'wget')
arch=('x86_64')
pkgdesc="A terminal command line interface that can customize the filter network traffic rule with BPF"
url="https://github.com/ZingerLittleBee/netop"
license=('MIT')

prepare() {
    cd $srcdir
    mkdir -p usr/share/licenses/netop
    wget https://raw.githubusercontent.com/ZingerLittleBee/netop/main/LICENSE --directory-prefix usr/share/licenses/netop
}

build() {
    cd $srcdir
    cargo install --root="$srcdir" --git=https://github.com/ZingerLittleBee/netop
}

package() {
    install -D "$srcdir/bin/netop" "$pkgdir/usr/bin/netop"
    install -D "$srcdir/usr/share/licenses/netop/LICENSE" "$pkgdir/usr/share/licenses/netop/LICENSE"
}

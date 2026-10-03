# Maintainer: Brooklyn <brooklyn.halmstad@proton.me>
pkgname=flummox-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Compress installed games and keep playing them"
arch=('x86_64' 'aarch64')
url="https://github.com/bybrooklyn/flummox"
license=('AGPL-3.0-or-later')
depends=('glibc>=2.39' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'fontconfig')
optdepends=('fuse3: Maximum Space mounts' 'zenity: native folder picker' 'kdialog: KDE folder picker')
provides=('flummox')
conflicts=('flummox')
options=('!strip' '!debug')
source_x86_64=("https://github.com/bybrooklyn/flummox/releases/download/v0.0.1/flummox-0.0.1-linux-x86_64.tar.xz")
source_aarch64=("https://github.com/bybrooklyn/flummox/releases/download/v0.0.1/flummox-0.0.1-linux-aarch64.tar.xz")
sha256sums_x86_64=('4c3ea54d4f2e4b2061f88b29b3d5b90a22293f95a06f1d6a303db828dfa6625c')
sha256sums_aarch64=('d75038b56223d91cb7193a30dfcfb8f17d9e93425a83618873ce0a5f765c8b36')

package() {
    cd "$srcdir/flummox-$pkgver-linux-$CARCH"
    install -Dm755 bin/flummox "$pkgdir/usr/bin/flummox"
    install -Dm755 bin/flummox-gui "$pkgdir/usr/bin/flummox-gui"
    install -Dm644 share/applications/flummox.desktop "$pkgdir/usr/share/applications/flummox.desktop"
    install -Dm644 lib/systemd/user/flummox-watch.service "$pkgdir/usr/lib/systemd/user/flummox-watch.service"
    install -Dm644 share/licenses/flummox/LICENSE "$pkgdir/usr/share/licenses/flummox/LICENSE"
    install -d "$pkgdir/usr/share/doc/flummox"
    cp -r share/doc/flummox/. "$pkgdir/usr/share/doc/flummox/"
}

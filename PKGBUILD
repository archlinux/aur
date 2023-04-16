# Maintainer: Ben DeCamp <ben_decamp@outlook.com>
pkgname=rymcast
pkgver=1.0.6
pkgrel=2
epoch=
pkgdesc="Sega Mega Drive (Genesis) VGM Player"
arch=('x86_64')
url="https://www.inphonik.com/products/rymcast-genesis-vgm-player/"
license=('Freeware'  )
groups=()
depends=()
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.inphonik.com/files/rymcast/rymcast-$pkgver-linux-x64.tar.gz"
        "$pkgname.png")
noextract=()
md5sums=('918f822009d55f555abd8590be8d3698'
         'f86a9ece20d108d76b58237ee0cc8a7e')

prepare() {
    gendesk -f -n --name='RYMCast' --exec='RYMCast' --pkgname "$pkgname" --pkgdesc "$pkgdesc"
    
}

package() {
    install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -d "$pkgdir/usr/bin"
    cp "RYMCast" "$pkgdir/usr/bin"
}

# Maintainer: Mahor1221 <mahor1221 at pm dot me>
# Maintainer: Padya1201 <padya1201 at gmail dot com>

pkgname=tachidesk-sorayomi-bin
__pkgname="${pkgname%-bin}"
__PkgName="$(echo "$__pkgname" | sed -e "s/\b./\u\0/g")"
__binname="$(echo "$__pkgname" | tr - _)"
pkgver=0.5.3
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance'
arch=('x86_64')
url="https://github.com/Suwayomi/$__PkgName"
license=('MPL2')
depends=('zenity' 'xdg-user-dirs')
optdepends=('tachidesk-server')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("$url/releases/download/$pkgver/$__pkgname-$pkgver-linux-x64.tar.gz")
sha256sums=('3662146140ec4a9473e4ff89f06aedd86dae6eb28c5c8cabca462a43ec15774b')

package() {
    cd "$srcdir/"
    install -dm755 "$pkgdir/opt/$__pkgname/"
    cp -a "data/" "lib/" "$__binname" "$pkgdir/opt/$__pkgname/"
    install -dm755 "$pkgdir/usr/bin/"
    ln -sr "$pkgdir/opt/$__pkgname/$__binname" "$pkgdir/usr/bin/$__pkgname"
    install -Dm644 "$__pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$__pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
}

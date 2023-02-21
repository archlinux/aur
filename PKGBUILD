# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Contributor: Mahor1221 <mahor1221 at pm dot me>

pkgname=tachidesk-jui
__PkgName=Tachidesk-JUI
pkgver=1.3.2
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("x86_64")
url="https://github.com/Suwayomi/Tachidesk-JUI"
license=("MPL2")
depends=("jre-openjdk>=17" "libc++")
provides=("tachidesk-jui")
__jar=$__PkgName-linux-x64-$pkgver.jar
source=("$url/releases/download/v$pkgver/$__jar" 
        "$pkgname.desktop"
        "$pkgname.png"
        "$pkgname.sh")
sha256sums=('a8c743ea5171f52bff6b8c0d8dd495796b78f67812938f1b3d42390a863e50ed'
            'ce97f5451bc5cc13a17c7fbc4302ff5c7d5761f7981dc85abca5005add76a84b'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            '1ef35a00f723229da2d15a062e1b589abb3f10d089a2f4801e31c03c25cb707b')

noextract=("$__jar")

package() {
    install -Dm644 "$srcdir/$__jar"               "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
    install -Dm644 "$srcdir/$pkgname.desktop"  -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/$pkgname.png"      -t "$pkgdir/usr/share/pixmaps/"
    install -Dm755 "$srcdir/$pkgname.sh"          "$pkgdir/usr/bin/$pkgname"
}

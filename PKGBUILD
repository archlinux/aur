# Maintainer: nelle the@nelle.observer

pkgname=packwitch-manager-bin
pkgver=0.1a
pkgrel=1
pkgdesc="minecraft modpack management tool"
arch=('x86_64')
url="https://codeberg.org/packwitch/packwitch"
license=('LGPL-3.0-or-later')
depends=('jdk21-openjdk')
provides=('packwitch-manager')
conflicts=('packwitch-manager')


source=("$pkgname-$pkgver.tar::https://codeberg.org/packwitch/packwitch/releases/download/0.1a/manager-0.1a.tar")
sha256sums=('2b1b8d1c00a4bafcac4fad78cb84506224a843ccb54c440df7bac21e0cb638fe')

package() {
    cd "$srcdir"

    tar -xf manager-*.tar

    cd manager-*/

    mv bin/manager bin/packwitch
    rm bin/manager.bat

    install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -r bin/* "$pkgdir/usr/bin/"
    cp -r lib/* "$pkgdir/usr/lib/"
}

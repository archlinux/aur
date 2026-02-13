# Maintainer: nelle the@nelle.observer

pkgname=packwitch-manager-bin
pkgver=0.1c
pkgrel=1
pkgdesc="minecraft modpack management tool"
arch=('x86_64')
url="https://codeberg.org/packwitch/packwitch"
license=('LGPL-3.0-or-later')
depends=('jdk21-openjdk')
provides=('packwitch-manager')
conflicts=('packwitch-manager')


source=("$pkgname-$pkgver.tar::https://codeberg.org/packwitch/packwitch/releases/download/$pkgver/manager-$pkgver.tar")
sha256sums=('d2764d8cc416433ff0a549c1fbd43b8d2501a13f136364a8806837577739b1c4')

package() {
    cd "$srcdir"

    tar -xf $pkgname-$pkgver.tar

    cd $pkgname-$pkgver/

    mv bin/manager bin/packwitch
    rm bin/manager.bat

    install -d "$pkgdir/usr/bin" "$pkgdir/usr/lib"
    cp -r bin/* "$pkgdir/usr/bin/"
    cp -r lib/* "$pkgdir/usr/lib/"
}

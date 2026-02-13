# Maintainer: nelle the@nelle.observer

pkgname=packwitch-manager-bin
pkgver=0.1d
pkgrel=1
pkgdesc="minecraft modpack management tool"
arch=('x86_64')
url="https://codeberg.org/packwitch/packwitch"
license=('LGPL-3.0-or-later')
depends=('jdk21-openjdk')
provides=('packwitch-manager')
conflicts=('packwitch-manager')


source=("$pkgname-$pkgver.tar::https://codeberg.org/packwitch/packwitch/releases/download/$pkgver/manager-$pkgver.tar")
sha256sums=('c4e845c84c5b525a70bf78db87d0bb7b6d7101b45fe141c9c4a46dc4bbebbbc2')

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

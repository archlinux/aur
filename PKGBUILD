# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=bgb
pkgver=1.5.9
pkgrel=2
pkgdesc='Game Boy emulator with advanced debugger'
arch=(x86_64)
url=https://bgb.bircd.org
depends=(wine)
makedepends=(unzip)
source=("$pkgname-$pkgver.zip::https://bgb.bircd.org/$pkgname$(echo "$pkgver" | tr -d .).zip"
        $pkgname)
noextract=("$pkgname-$pkgver.zip")
md5sums=('2c63d9be39923de44478f27baa43d316'
         'a1ec5ad256ed7e26d4484f1faa8371b3')

prepare() {
    cd "$srcdir"
    mkdir -p "$pkgname-$pkgver"
    unzip -d "$pkgname-$pkgver" "$pkgname-$pkgver.zip"
}

package() {
    mkdir -p "$pkgdir/usr/lib"
    cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/lib/$pkgname"
    install -Dt "$pkgdir/usr/bin" "$srcdir/$pkgname"
}

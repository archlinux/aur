# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=bgb
pkgver=1.5.8
pkgrel=2
pkgdesc='Game Boy emulator with advanced debugger'
arch=(x86_64)
url=https://bgb.bircd.org
depends=(wine)
source=("$pkgname-$pkgver.zip::https://bgb.bircd.org/bgb.zip"
        $pkgname)
noextract=("$pkgname-$pkgver.zip")
md5sums=('15b8b380c45f8cbe9e598f7224fd341e'
         '4d4059bc274aa50619dc82fc749af9f3')

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

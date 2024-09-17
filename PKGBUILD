# Maintainer: Manos Vlassis <aur@mvlassis.com>
# Maintainer: Quint Guvernator <quint@guvernator.net>

pkgname=bgb
pkgver=1.6.4
pkgrel=1
pkgdesc='Game Boy emulator with advanced debugger'
arch=(x86_64)
url=https://bgb.bircd.org
depends=(wine)
source=("$pkgname-$pkgver.zip::https://bgb.bircd.org/$pkgname$(echo "$pkgver" | tr -d .).zip"
        $pkgname)
noextract=("$pkgname-$pkgver.zip")
md5sums=('69c06f8737cce5618b6ffbbe2f7f07d2'
         '4973920e5084d1640a45bc31dffff797')

prepare() {
    cd "$srcdir"
    mkdir -p "$pkgname-$pkgver"
	bsdtar -xf "$pkgname-$pkgver.zip" -C "$pkgname-$pkgver"
}

package() {
    mkdir -p "$pkgdir/usr/lib"
    cp -r "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/lib/$pkgname"
    install -Dt "$pkgdir/usr/bin" "$srcdir/$pkgname"
}

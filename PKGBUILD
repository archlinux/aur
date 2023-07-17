# Maintainer: Philipp Klein <philipptheklein AT gmail DOT com>

pkgname=fazua-toolbox
pkgver=2.18
pkgrel=1
pkgdesc="Toolbox Software to update and customize the Fazua Energy Ride System"
arch=('x86_64')
url="https://fazua.com/en/support/help-center/toolbox-software/entry-toolbox-software/"
license=('unknown')
_filename="FAZUA_Toolbox_basic-linux-x86_64"

source=("https://fazua.com/documents/1482/$_filename-$pkgver.tar.gz"
        'fazua-toolbox.desktop'
        'logo-symbol.svg')

sha256sums=('d6b5fab83c21a4938a812c9dd2e590a61897b53778e01d4e1df9ae0e8ceb0385'
            '5cf3ccc9cc75f4431cf59f0410b253046a946cb76dcba0ef4ac9bedd2c1ec6c7'
            '59e35260d3b42927040e6369c483998e7acedd112b26d89d1e226dbd9501169d')

package() {
    cd "$srcdir"

    install -Dm 644 99-ebike.rules "$pkgdir/usr/lib/udev/rules.d/99-ebike.rules"

    install -Dm 755 "$_filename-$pkgver" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 logo-symbol.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


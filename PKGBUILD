# Maintainer: Philipp Klein <philipptheklein AT gmail DOT com>

pkgname=fazua-toolbox
pkgver=2.24
pkgrel=1
pkgdesc="Toolbox Software to update and customize the Fazua Energy Ride System"
arch=('x86_64')
url="https://fazua.com/en/support/help-center/toolbox-software/entry-toolbox-software/"
license=('unknown')
options=(!debug)
_filename="FAZUA_Toolbox_basic-linux-x86_64"

source=("https://fazua.com/documents/1595/$_filename-$pkgver.tar.gz"
        'fazua-toolbox.desktop'
        'logo-symbol.svg')

sha256sums=('5d15b86574ab833df94fdbc7676da88841c2aab3e20691bf53a3904b91179b04'
            '5cf3ccc9cc75f4431cf59f0410b253046a946cb76dcba0ef4ac9bedd2c1ec6c7'
            '59e35260d3b42927040e6369c483998e7acedd112b26d89d1e226dbd9501169d')

package() {
    cd "$srcdir"

    install -Dm 644 99-ebike.rules "$pkgdir/usr/lib/udev/rules.d/99-ebike.rules"

    install -Dm 755 "$_filename-$pkgver" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 logo-symbol.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


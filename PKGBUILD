# Maintainer: Philipp Klein <philipptheklein AT gmail DOT com>

pkgname=fazua-toolbox
pkgver=2.0
pkgrel=1
pkgdesc="Toolbox to update and control the Fazua evation drive system"
arch=('any')
url="https://fazua.com/en/drive-system/software/toolbox-software/"
license=('unknown')

source=("https://fazua.com/documents/692/FAZUA_Toolbox_basic_$pkgver.zip"
        'fazua-toolbox.sh'
        'fazua-toolbox.desktop'
        'Fazua_polygon_blue.svg')

sha256sums=('8cbf29bc1882f51e9bf40a2531b81a3a4293faccc07826a1b950c4e7c36b073d'
            'a7a73c69dc9feab8345684fc8c1af07c63223846b03c169649321f98a5aa82d0'
            '79dfa335817115d25c45fe53904dd41fb225173b1d727d616ed0b38d65fb86b3'
            'e874bf65f880aa30cd2fabfeb73262a4ddd0326f99b40b8033c62a343fe49d66')

depends=('jre8-openjdk' 'java8-openjfx')

package() {
    cd "$srcdir"

    install -Dm 644 99-ebike.rules "$pkgdir/usr/lib/udev/rules.d/99-ebike.rules"

    install -Dm 755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm 755 FAZUA_Toolbox_basic_2.0.run "$pkgdir/opt/$pkgname/FAZUA_Toolbox_basic_2.0.run"

    install -Dm 644 Fazua_polygon_blue.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
    install -Dm 644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}


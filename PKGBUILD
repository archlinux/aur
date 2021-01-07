# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thibaud Kehler <thibaud.kehler at gmx dot net>
pkgname=adnw-kbd-layouts
pkgver=1.0
pkgrel=1
pkgdesc="Keymaps for the german keyboard layouts AdNW and KOY"
arch=(any)
url="http://www.adnw.de/"
license=('unknown')
source=("http://www.adnw.de/uploads/Main/Downloads/koy.map.gz"
        "http://www.adnw.de/uploads/Main/Downloads/adnw.tar.gz")
noextract=("koy.map.gz")
sha256sums=('49323903103d47ef985fdce30f17b5b4ce139ec8a5b6e452f45bc9e27b80a1d9'
            '7524d704a2972077297b1f885c7f50f6a5d042763567bb26b1e7caeaecd3b0e8')

build() {
    # Add linebreak at EOF to avoid syntax error.
	gunzip -c "koy.map.gz" | sed -e '$a\' | gzip > "koy.map.gz2"
> "koy.map"
}

package() {
    install -m644 -DT "koy.map.gz2" "$pkgdir/usr/share/kbd/keymaps/i386/adnw/koy.map.gz"
    install -m644 -DT "adnw.map.gz" "$pkgdir/usr/share/kbd/keymaps/i386/adnw/adnw.map.gz"
}

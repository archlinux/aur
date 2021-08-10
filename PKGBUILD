# Maintainer: Oshgnacknak <osh@oshgnacknak.de>
pkgname=vegalinux64
pkgver=1
pkgrel=2
epoch=
pkgdesc="Chess tournament administration sorfware"
arch=('x86_64')
url="https://www.vegachess.com"
license=('Custom')
groups=()
depends=('jre8-openjdk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.vegachess.com/download/$pkgname.tar.gz"
        'vegachess.desktop'
        'vegateam.desktop')
noextract=()
sha256sums=('6f9ba9ee0da41b412b2e3be18ae7b02710abe6672d38c5a56ae54ca466d78e5a'
            '0ca71921a84035f42968d938f426383c2a98530d9096d941cc5be0f168f3a79b'
            'f37e48211f22274873f9c8b8e3f1a66d6c032a145b07367682ecf99d70cade5c')

package() {
    cd "$srcdir"
    mkdir -p $pkgdir/usr/share/applications
    cp -v *.desktop $pkgdir/usr/share/applications

    cd "$pkgname"
    mkdir -p $pkgdir/usr/share/$pkgname
    cp -rv * $pkgdir/usr/share/$pkgname

    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/share/$pkgname/Vega $pkgdir/usr/bin/Vega
    ln -s /usr/share/$pkgname/VegaTeam $pkgdir/usr/bin/VegaTeam
}

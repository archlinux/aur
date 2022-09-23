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
depends=('jre8-openjdk'
         'libmysqlclient')
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
        'vegateam.desktop'
        'logo.png')
noextract=()
sha256sums=('0e86c7dd3b71e112cef7684e7f13d0d1116fa022988cf32af84d03ea098d451e'
            '7ed253af097df983fc1ead3b77cd0ebb443696b32a0c50399d316f31e4b1c51b'
            'e6b762f998a4cf88e7b52a4a7884c58c55cf0939e7077f1d038868a2706115fc'
            'ac0385b28ad27877947913ae486d619f39c495d4e69369066e7e10755247bfc6')

package() {
    cd "$srcdir"
    mkdir -p $pkgdir/usr/share/applications
    cp -v *.desktop $pkgdir/usr/share/applications

    mkdir -p $pkgdir/usr/share/$pkgname
    cp -v logo.png $pkgdir/usr/share/$pkgname

    cd "VegaDistribution/$pkgname"
    cp -rv * $pkgdir/usr/share/$pkgname

    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/share/$pkgname/Vega82 $pkgdir/usr/bin/Vega
    ln -s /usr/share/$pkgname/VegaTeam5 $pkgdir/usr/bin/VegaTeam
}

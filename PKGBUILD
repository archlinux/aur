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
        'vegateam.desktop'
        'logo.png')
noextract=()
sha256sums=('9ff31e38d2a4c48e7ccd10cafb44d63f7399c74911543897b7375d888da42e59'
            '50936a1e32642f599797fb991f303b833d949f23c676a25c783d2e610e884ccb'
            '6d6d077594a73211cde79043d661735f84f39929fb2d9fdff48d311dc1269b48'
            'ac0385b28ad27877947913ae486d619f39c495d4e69369066e7e10755247bfc6')

package() {
    cd "$srcdir"
    mkdir -p $pkgdir/usr/share/applications
    cp -v *.desktop $pkgdir/usr/share/applications

    mkdir -p $pkgdir/usr/share/$pkgname
    cp -v logo.png $pkgdir/usr/share/$pkgname

    cd "$pkgname"
    cp -rv * $pkgdir/usr/share/$pkgname

    mkdir -p $pkgdir/usr/bin/
    ln -s /usr/share/$pkgname/Vega $pkgdir/usr/bin/Vega
    ln -s /usr/share/$pkgname/VegaTeam $pkgdir/usr/bin/VegaTeam
}

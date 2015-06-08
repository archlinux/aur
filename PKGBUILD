# Maintainer: Elis Axelsson <etu@failar.nu>
pkgname=svorak
pkgver=0.2
pkgrel=1
pkgdesc="svorak, one swedish dvorak"
arch=('any')
url="http://aoeu.info/"
license=('ISC')
groups=('keyboardlayouts')
depends=()
makedepends=() # TODO: Fill this with something that is used
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://www.aoeu.info/layouts/files/svorak.map.gz')
noextract=()
md5sums=('310d74295f2c3fb9f8ef4dfaa940bdc4')

build() {
    mkdir -p "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"

    mkdir -p usr/share/kbd/keymaps/i386/dvorak

    cp $srcdir/../svorak.map.gz usr/share/kbd/keymaps/i386/dvorak/svorak-yescapslock.map.gz
    cat $srcdir/../svorak.map.gz | gunzip -c | sed 's/Caps_Lock/Control/' | gzip -c > usr/share/kbd/keymaps/i386/dvorak/svorak.map.gz
}

package() {
    cd "$pkgname-$pkgver"

    cp -vr ./usr/ $pkgdir;
}

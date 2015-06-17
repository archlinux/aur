# Maintainer: Elis Axelsson <etu@failar.nu>
pkgname=svorak
pkgver=0.2
pkgrel=1
pkgdesc="svorak, one swedish dvorak"
arch=('any')
url="http://aoeu.info/"
license=('Public-Domain')
groups=('keyboardlayouts')

makedepends=('gzip')

source=('http://www.aoeu.info/layouts/files/svorak.map.gz')
noextract=('svorak.map.gz')

md5sums=('310d74295f2c3fb9f8ef4dfaa940bdc4')
sha1sums=('a5f7da109c228e61a8b24e01b6a872cb906b30d3')
sha256sums=('fbf33afa1dbd1442e7cf44761f87acb6e11f7dae19120b03afe1e4951c32be87')
sha512sums=('f9e5afc2e9b4538899471defe1fc4bb03e87b588163de44b02de6bbc6513a860e3d6f06751d6fcb991b3f9ffaef32aeb3a368fdf0cc06a14e21247769357b548')

build() {
    mkdir -p "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"

    mkdir -p usr/share/kbd/keymaps/i386/dvorak

    cp $srcdir/../svorak.map.gz usr/share/kbd/keymaps/i386/dvorak/svorak-yescapslock.map.gz
    zcat $srcdir/../svorak.map.gz | sed 's/Caps_Lock/Control/' | gzip -c > usr/share/kbd/keymaps/i386/dvorak/svorak.map.gz
}

package() {
    cd "$pkgname-$pkgver"

    cp -vr ./usr/ $pkgdir;
}

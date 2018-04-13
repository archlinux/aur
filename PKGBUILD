# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=kmfl-keyboard-eurolatin
pkgver=1.6
pkgrel=2
pkgdesc="EuroLatin keyboard for KMFL"
arch=('any')
url="http://tavultesoft.com/eurolatin/"
license=('custom')
source=('http://tavultesoft.com/eurolatin/eurolatin-source-1.6.zip'
        'package.patch')
depends=('ibus-kmfl')
noextract=()
options=()
md5sums=('c3dbc380da4ef9249c4699a4c0a98f80'
         '3ead5f14aad656643a5ac964c54b7134')

prepare() {
    cd "EuroLatin Source Files"
    patch -Np1 -i "${srcdir}/package.patch"
}

package() {
    cd "EuroLatin Source Files"
    install -Dm644 'licence.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'european.kmn' "$pkgdir/usr/share/kmfl/european.kmn"
    install -Dm644 \
        'EuroLatin Keyman Desktop Keyboard Files/eurolatin1.6.pdf' \
        "$pkgdir/usr/share/doc/$pkgname/eurolatin-1.6.pdf"
}

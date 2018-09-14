# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=nbuexplorer
pkgname=$_pkgname-bin
pkgver=3.3
pkgrel=2
pkgdesc='Nokia NBU, NBF, NFB, NFC and ARC backup file parser, extractor and viewer.'
arch=('any')
url='https://sourceforge.net/projects/nbuexplorer/'
license=('GPL3')
depends=('mono')
source=(
    "https://sourceforge.net/projects/$_pkgname/files/Releases/v${pkgver/./}/NbuExplorer_v$pkgver.zip"
    "$_pkgname.sh"
)
makedepends=('bash>=4.0')
sha256sums=('f91d009c0d24129e204e829a33479fcac51434d1c079ac0127661c8b22868a02'
            '99c81f346e7c5ecbb1f880d341c775ab27358d9fad9bec76b85be8c2ed30f2d2')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

package() {
    install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 NbuExplorer.exe "$pkgdir/usr/lib/$_pkgname/NbuExplorer.exe"
    install -Dm644 readme.txt "$pkgdir/usr/share/doc/$_pkgname/readme.txt"
    install -Dm644 changelog.txt "$pkgdir/usr/share/doc/$_pkgname/changelog.txt"
}

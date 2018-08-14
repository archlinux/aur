# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=NbuExplorer
_pkgname2=${_pkgname,,}  # lowercase
pkgname=$_pkgname2-bin
pkgver=3.3
pkgrel=1
pkgdesc='Nokia NBU, NBF, NFB, NFC and ARC backup file parser, extractor and viewer.'
arch=('any')
url='https://sourceforge.net/projects/nbuexplorer/'
license=('GPL2')
depends=('mono')
source=(
    "https://sourceforge.net/projects/$_pkgname2/files/Releases/v${pkgver/./}/${_pkgname}_v${pkgver}.zip"
    "${_pkgname2}.sh"
)
makedepends=('bash>=4.0')
sha256sums=('f91d009c0d24129e204e829a33479fcac51434d1c079ac0127661c8b22868a02'
            '1edb0c0323ce3cfab9e7e4f1d7698592e712d267d953c7a3964bb5d6b28c1c0d')
provides=("$_pkgname2=$pkgver")
conflicts=("$_pkgname2")

package() {
    cd "$srcdir"

    install -Dm755 ${_pkgname2}.sh "$pkgdir/usr/bin/$_pkgname2"
    install -Dm644 ${_pkgname}.exe "$pkgdir/usr/lib/$_pkgname2/${_pkgname}.exe"
    install -Dm644 license.rtf "$pkgdir/usr/share/licenses/$_pkgname2/license.rtf"
    install -Dm644 readme.txt "$pkgdir/usr/share/doc/$_pkgname2/readme.txt"
    install -Dm644 changelog.txt "$pkgdir/usr/share/doc/$_pkgname2/changelog.txt"
}


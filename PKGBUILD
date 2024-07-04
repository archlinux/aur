# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-flacconvert
pkgver=2
pkgrel=1
pkgdesc='KDE service menus for flac file converting'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-flacconvert'
license=('GPL')
depends=('dolphin' 'kdialog' 'flac' 'lame' 'opus-tools')
conflicts=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")
replaces=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('05f78d02f171773f4b0c97cda1cf051700194835cb85328b0ffcec4e0d48db54')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-flacconvert
pkgver=1
pkgrel=1
pkgdesc='KDE service menus for flac file converting'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-flacconvert'
license=('GPL')
depends=('dolphin' 'kdialog' 'flac' 'lame' 'opus-tools')
conflicts=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")
replaces=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('7a5c701e94b8ecf6ca256e20a641100182e069bf5aa4313bdd94d565f9af7ddf')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

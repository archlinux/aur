# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-flacconvert
pkgver=2
pkgrel=2
pkgdesc='KDE service menus for flac file converting'
arch=('any')
url='https://invent.kde.org/marcon/kf6-servicemenus-flacconvert.git/'
license=('GPL')
depends=('dolphin' 'kdialog' 'flac' 'lame' 'opus-tools')
conflicts=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")
replaces=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")

source=("${url}/-/archive/v2/${pkgname}-v${pkgver}.tar.gz")

sha256sums=('5ef65ff560e08ff3fd90718767869e5d08c5a1428730d6341fb2ab7d356effbc')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

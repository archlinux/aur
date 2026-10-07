# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-flacconvert
pkgver=3
pkgrel=1
pkgdesc='KDE service menus for flac file converting'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-flacconvert'
license=('GPL')
depends=('dolphin' 'kdialog' 'flac' 'lame' 'opus-tools')
conflicts=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")
replaces=("kde-servicemenus-flacconvert" "kf5-servicemenus-flacconvert")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('13538ecf6e76c214f761b8bec5bfe53c8f7486e4954458698fade5b7fbfc692d')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
}

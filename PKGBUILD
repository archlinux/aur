# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-imagetools
pkgver=1
pkgrel=1
pkgdesc='KDE service menus for image file processing'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-imagetools'
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'perl-image-exiftool' 'optipng')
conflicts=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")
replaces=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('d0c5accc941e36f47fe43ed97d67ac6e315b6942a7598827d9ce869f898f5c42')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

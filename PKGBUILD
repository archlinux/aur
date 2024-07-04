# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf6-servicemenus-imagetools
pkgver=3
pkgrel=1
pkgdesc='KDE service menus for image file processing'
arch=('any')
url='https://github.com/marco-mania/kf6-servicemenus-imagetools'
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'perl-image-exiftool' 'optipng' 'pngquant')
conflicts=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")
replaces=("kde-servicemenus-imagetools" "kf5-servicemenus-imagetools")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('5fb1c2b9109f96723222361432c2e3e9c0b3234d4880a4502dc6eef7eac1dcf1')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kio/servicemenus/"
    install -m 644 "${pkgname}-${pkgver}"/servicemenus/*.desktop "${pkgdir}/usr/share/kio/servicemenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

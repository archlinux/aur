# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf5-servicemenus-imagetools
pkgver=4
pkgrel=2
pkgdesc='KDE service menus for image file processing'
arch=('any')
url='https://github.com/marco-mania/kf5-servicemenus-imagetools'
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'perl-image-exiftool' 'optipng')
conflicts=("kde-servicemenus-imagetools")
replaces=("kde-servicemenus-imagetools")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('adfe66ba531ccf8d36d7f428efccd94df2cefa41d16cacaf09320ffcd034fb5e')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -m 644 "${pkgname}-${pkgver}"/ServiceMenus/*.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

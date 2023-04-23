# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kde-servicemenus-imagetools
pkgver=3
pkgrel=1
pkgdesc='KDE service menus for image file processing'
arch=('any')
url='https://github.com/marco-mania/kde-servicemenus-imagetools'
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'perl-image-exiftool' 'optipng')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('bdedb328e9e3da25cd889ea7d933d11bc5b6b79e9e1107eae84ece3331a0e80d')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -m 644 "${pkgname}-${pkgver}"/ServiceMenus/*.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

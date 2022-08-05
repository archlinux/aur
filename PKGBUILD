# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kde-servicemenus-imagetools
pkgver=2
pkgrel=1
pkgdesc='KDE service menus for image file processing'
arch=('any')
url='https://github.com/marco-mania/kde-servicemenus-imagetools'
license=('GPL')
depends=('dolphin' 'kdialog' 'imagemagick' 'perl-image-exiftool' 'optipng')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('ad2e1fa77b7335cf72398e22a9cbdc376463a5d6347cc147704861d4c55d7f5d')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -m 644 "${pkgname}-${pkgver}"/ServiceMenus/*.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kf5-servicemenus-flacconvert
pkgver=4
pkgrel=3
pkgdesc='KDE service menus for flac file converting'
arch=('any')
url='https://github.com/marco-mania/kf5-servicemenus-flacconvert'
license=('GPL')
depends=('dolphin' 'kdialog' 'flac' 'lame' 'opus-tools')
conflicts=("kde-servicemenus-flacconvert")
replaces=("kde-servicemenus-flacconvert")

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('19bd13b25e292adaad0a14154c50bd0a207236ba2245819c9a9efd3453dd798b')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -m 644 "${pkgname}-${pkgver}"/ServiceMenus/*.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

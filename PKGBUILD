# Maintainer: Marco <marcomania2012 at gmail dot com>

pkgname=kde-servicemenus-flacconvert
pkgver=2
pkgrel=1
pkgdesc='KDE service menus for flac file converting'
arch=('any')
url='https://github.com/marco-mania/kde-servicemenus-flacconvert'
license=('GPL')
depends=('dolphin' 'kdialog' 'flac' 'lame' 'opus-tools')

source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('b32743f631708146a86509f6f83fe0b833795a5d9e3c07350061bbcaf0bdaf35')

package() {
    cd "${srcdir}"
    install -dm 755 "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -m 644 "${pkgname}-${pkgver}"/ServiceMenus/*.desktop "${pkgdir}/usr/share/kservices5/ServiceMenus/"
    install -dm 755 "${pkgdir}/usr/bin/"
    install -m 755 "${pkgname}-${pkgver}"/bin/* "${pkgdir}/usr/bin/"
    install -Dm 644 "${pkgname}-${pkgver}"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

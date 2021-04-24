# Maintainer: DisLogicator <supasecrethacker@gmail.com>
# PKGBUILD make by Jhyub

pkgname='hoffice'
pkgver=11.20.0.1520
pkgrel=1
pkgdesc="한글, 한셀, 한쇼 뿐만 아니라 MS 워드, 파워포인트 ,
엑셀 문서를 편집할 수 있는 한컴오피스 통합 편집기입니다.(This program is extracted from Hancom Gooroom OS in /opt/hnc/*. For more information please check https://github.com/DisLogicator/hoffice/)"
arch=('x86_64')
url='https://www.hancom.com/'
license=('custom:hoffice')
depends=('harfbuzz-icu')
source=(
    "https://github.com/DisLogicator/hoffice/releases/download/11.20.0.1520/hoffice-11.20.0.1520.tar.gz"
    "LICENSE"
)
sha256sums=(
    'eb0bd9ac1571fc5ab6f9ea906e9ee2749f2413a53d1aec5a15c419bc7d535925'
    'bd67280ffdf6928abab99f3f7f01ad46b19d85d641bd49286ef6d3e6a258cee3'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname" "${srcdir}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}"/*.desktop
    mkdir ~/hnc
    install -Dm644 -t "${pkgdir}~/hnc" "${srcdir}"/*.png
    mkdir "${pkgdir}/opt"
    mkdir "${pkgdir}/opt/hnc"
    bsdtar -xf hoffice11.zip -C "${pkgdir}/opt/hnc"


}

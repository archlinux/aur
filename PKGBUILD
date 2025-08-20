# Maintainer: dibof228

pkgname=eblan-browser
pkgver=0.2
pkgrel=2

pkgdesc="Best browser for potato"
arch=("any")
url='https://twgood.serv00.net/browser/S/'
license=("custom:eblan-browser")
categories=("network")

depends=("python-pyqt5" "qt5-webengine" "python-pyqt5-webengine" "python")

source=("https://twgood.serv00.net/browser/S/dl/Eblan.zip" eblan.desktop)
md5sums=('SKIP' 'SKIP')

package() {
    mkdir "${pkgdir}/opt"
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/EblanS" "${pkgdir}/opt"
    install -Dm644 "${srcdir}/eblan.desktop" "${pkgdir}/usr/share/applications/eblan.desktop"
}

post_install(){
    update-desktop-database /usr/share/applications
}

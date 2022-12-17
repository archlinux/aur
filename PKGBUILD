# Maintainer: Saurabh Kumar Sharma <imesskayesss@protonmail.com>

_appname=imgbrd-grabber
pkgname="${_appname}-bin"
pkgver=7.10.0
pkgrel=1
pkgdesc="Unofficial binary installer for ImgBrd Grabber"
arch=("x86_64")
depends=('qt5-multimedia' 'qt5-declarative' 'nodejs' 'qt5-networkauth' 'qt5-base' 'krb5')
url="https://github.com/Bionus/imgbrd-grabber"
license=("Apache-2.0 License")
options=('!strip')
conflicts=('imgbrd-grabber-git')

source=("${pkgver}.tar.gz::https://github.com/Bionus/imgbrd-grabber/releases/download/v${pkgver}/Grabber_v${pkgver}.tar.gz")
sha256sums=("SKIP")

package(){
    install -dm755 "${pkgdir}/"{opt/${_appname},usr/share/applications,usr/bin,usr/share/icons/}
    cp -a "${srcdir}/." "${pkgdir}/opt/${_appname}/"
    cp -r "${srcdir}/hicolor" "${pkgdir}/usr/share/icons/hicolor"
    ln -s "/opt/${_appname}/"{Grabber,Grabber-cli} "${pkgdir}/usr/bin/"
    install -D "${srcdir}/grabber.desktop" -t "${pkgdir}/usr/share/applications/"
}

# Maintainer: github.com/Jestar342

pkgver=0.2
pkgrel=1
pkgname=sddm-theme-redrock
pkgdesc="Redrock, a MacOS inspired SDDM theme"
url="https://github.com/astize/redrock"
arch=('any')
depends=('sddm')
source=("https://github.com/astize/redrock/archive/v${pkgver}.tar.gz")
md5sums=('4af2a10b1a131e8f0fdbf20d00d62524')
license=('CCPL:by-sa')

prepare() {
    # Case-sensitive reference to 'Components' dir in Main.qml
    mv "${srcdir}/redrock-${pkgver}/components" "${srcdir}/redrock-${pkgver}/Components"
}

package() {
    install -d "${pkgdir}"/usr/share/sddm/themes/$pkgname
    cp -r "${srcdir}/redrock-${pkgver}/" "${pkgdir}/usr/share/sddm/themes/redrock/"
}


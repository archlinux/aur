# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>

pkgname=spriteilluminator
pkgver=1.2.2
pkgrel=1
pkgdesc="Image manipulation tool designed with game developers in mind"
arch=('x86_64')
url="http://www.codeandweb.com"
license=('custom:spriteilluminator')
install='spriteilluminator.install'
depends=('glib2' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
source=("https://www.codeandweb.com/download/spriteilluminator/${pkgver}/SpriteIlluminator-${pkgver}-ubuntu64.deb")
md5sums=('058c11e1fd075c8ef69303cbdc2e37e7')

build() {
    ar -xv "SpriteIlluminator-${pkgver}-ubuntu64.deb"
    tar -xvf data.tar.xz
}

package() {
    # Program
    mv ${srcdir}/usr ${pkgdir}
    # License
    install -Dm644 "${pkgdir}/usr/share/spriteilluminator/documents/LicenseAgreement.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.html"
}

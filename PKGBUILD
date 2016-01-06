# Maintainer: Wilson E. Alvarez <wilson.e.alvarez@hotmail.com>

pkgname=physicseditor
pkgver=1.5.2
pkgrel=1
pkgdesc="Physics editor for certain game engines such as Cocos2D-X, Corona SDK, etc."
arch=('x86_64')
url="http://www.codeandweb.com"
license=('custom:physicseditor')
install='physicseditor.install'
depends=('glib2' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
source=("https://www.codeandweb.com/download/physicseditor/${pkgver}/PhysicsEditor-${pkgver}-ubuntu64.deb")
md5sums=('05c3267ab57964659776ecc31557ee40')

build() {
    ar -xv "PhysicsEditor-${pkgver}-ubuntu64.deb"
    tar -xvf data.tar.xz
}

package() {
    # Program
    mv ${srcdir}/usr ${pkgdir}
    # License
    install -Dm644 "${pkgdir}/usr/share/physicseditor/documents/LicenseAgreement.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.html"
}

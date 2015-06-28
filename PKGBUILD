# Maintainer: Etzos <supercodingmonkey @ gmail.com>
# Contributer: Gordin <9ordin @t gmail dot com>

pkgname=texturepacker
pkgver=3.7.1
pkgrel=1
pkgdesc="Sprite sheet creator and image optimizer"
arch=('x86_64')
url="http://www.texturepacker.com"
license=('custom:texturepacker')
install='texturepacker.install'
depends=('glib2' 'hicolor-icon-theme' 'desktop-file-utils' 'shared-mime-info')
source=("http://www.codeandweb.com/download/texturepacker/${pkgver}/TexturePacker-${pkgver}-ubuntu64.deb")
md5sums=('9f75c5786602dc3942fdce2e3fe7a763')

build() {
    ar -xv "TexturePacker-${pkgver}-ubuntu64.deb"
    tar -xvf data.tar.xz
}

package() {
    # Program
    mv ${srcdir}/usr ${pkgdir}
    # License
    install -Dm644 "${pkgdir}/usr/share/texturepacker/documents/LicenseAgreement.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.html"
}

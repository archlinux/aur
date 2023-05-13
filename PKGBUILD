# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributer: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=texturepacker
pkgver=7.0.3
pkgrel=1
pkgdesc="Sprite sheet creator and image optimizer"
arch=('x86_64')
url="https://www.codeandweb.com/$pkgname"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils' 'grantlee'
    'gcc-libs-multilib' 'qt5-svg' 'qt5-declarative' 'qt5-imageformats'
    'qt5-quickcontrols')
source=("https://www.codeandweb.com/download/$pkgname/${pkgver}/TexturePacker-${pkgver}.deb")
sha256sums=("54019d3146c62031bbe387ddccbb640e215499ee1c23aaf8e324d9fec48ba826")

build() {
    ar -x "TexturePacker-${pkgver}.deb"
}

package() {
    cd ${srcdir}/

    # Extract to the $pkgdir.
    tar xJf data.tar.xz -C "${pkgdir}/"

    # Enter $pkgdir.
    cd ${pkgdir}/usr/lib/$pkgname/

    install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.txt"
}

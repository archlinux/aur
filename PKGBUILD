# Maintainer: Bink <B-Interactive@users.noreply.github.com>

pkgname=texturepacker-6.0.1
_givenname=texturepacker
pkgver=6.0.1
pkgrel=2
pkgdesc="Sprite sheet creator and image optimizer. This version (6.0.1) is the last to support ATF and PVR(v2) formats, as these were removed from 6.0.2 onward."
arch=('x86_64')
url="https://www.codeandweb.com/$_givenname"
license=("custom:$_givenname")
install="$_givenname.install"
depends=('shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils' 'grantlee'
    'gcc-libs-multilib' 'qt5-svg' 'qt5-declarative' 'qt5-imageformats'
    'qt5-quickcontrols')
provides=('texturepacker')
conflicts=('texturepacker')
source=("https://www.codeandweb.com/download/$_givenname/${pkgver}/TexturePacker-${pkgver}.deb")
sha256sums=('8dc694c77e57e9b26279a4e205543143761ad4c54ec8fe7e4cdc12ee70b0c1b1')

build() {
    ar -x "TexturePacker-${pkgver}.deb"
}

package() {
    cd "${srcdir}"/ || exit

    # Extract to the $pkgdir.
    tar xJf data.tar.xz -C "${pkgdir}/"

    # Enter $pkgdir.
    cd "${pkgdir}"/usr/lib/$_givenname/ || exit

    install -Dm644 "${pkgdir}/usr/share/$_givenname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${_givenname}/LicenseAgreement.txt"
}

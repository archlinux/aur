# Maintainer: konez2k@aur
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributer: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=texturepacker
pkgver=7.10.0
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
sha256sums=('32aa7a7e3896ce29eda104ce14e68736a384e8551ba5d88685b5707876f5c472')

build() {
    ar -x "TexturePacker-${pkgver}.deb"
}

package() {
    cd ${srcdir}/

    # Extract to the $pkgdir.
    tar --use-compress-program=zstd -xf data.tar.zst -C "${pkgdir}/"

    # Enter $pkgdir.
    cd ${pkgdir}/usr/lib/$pkgname/

    install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.txt"
}

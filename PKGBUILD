# Maintainer: Gary S Martin (K6AE) <gsm--3782cielo+chirp[at]martin-fam[dot]net>

pkgname=chirp-next-bin
pkgver=20260828
pkgrel=1
epoch=1
pkgdesc="GUI tool for programming ham radios (AppImage binary)"
arch=('x86_64')
url="https://chirpmyradio.com/projects/chirp/wiki/Home"
license=('GPL-3.0-or-later')

depends=('fuse2')
optdepends=('hamradio-menus: XDG menus for ham radio software')

provides=('chirp')
conflicts=('chirp' 'chirp-daily' 'chirp-next')

options=('!strip' '!debug')

_appimage="Chirp-next-${pkgver}-${CARCH}.AppImage"

noextract=("${_appimage}")

source=(
    "${_appimage}::https://github.com/GaryScottMartin/chirp-next-mirror/releases/download/${pkgver}/${_appimage}"
    'chirp.desktop'
    'chirp.png'
)

sha256sums=('1be9ba2b21a76953c8d8483893474560382758ddca54f4d4cb0a0db8fcd78f5f'
            'b70bd2d91d0277d3820010ee9d2dfe7f7b6e6d92c640cc3b51a6ec2e18be6aae'
            'aecc40abb16119e386c922ec48ee7d8bc6949ccb207ac03a7d0f620f0b9120ac')

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/usr/bin/chirp"

    install -Dm644 "${srcdir}/chirp.desktop" \
        "${pkgdir}/usr/share/applications/chirp.desktop"

    install -Dm644 "${srcdir}/chirp.png" \
        "${pkgdir}/usr/share/pixmaps/chirp.png"
}

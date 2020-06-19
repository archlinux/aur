# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>
#
# Open firefox to get the install link rendered
# Select the packaged version and inspect the "add to Firefox"
# https://addons.mozilla.org/firefox/downloads/file/3453460/mooltipass_extension-1.8.0-fx.xpi?src=search
_extension_name='mooltipass_extension'
_extension_id='{da36041e-5ce1-4c8a-9dc5-406cc98f0a23}'
_extension_dirname=3453460
_extension_suffix=-fx
pkgname="firefox-extension-mooltipass"
pkgver=1.8.0
pkgrel=2
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('firefox'
         'moolticute')
source=("${pkgname}-${pkgver}${_extension_suffix}.xpi::""https://addons.mozilla.org/firefox/downloads/file/${_extension_dirname}/${_extension_name}-${pkgver}${_extension_suffix}.xpi"
        'LICENSE')
sha256sums=('82e0460d9df48f8f9ed0393f4e3631284f332492c6b932df79c05e0025962330'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${pkgname}-${pkgver}${_extension_suffix}.xpi")

package() {
    cd "${srcdir}"

    install -Dm 644 "${pkgname}-${pkgver}${_extension_suffix}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

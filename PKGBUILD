# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_extension_name='mooltipass_extension'
_extension_id='{da36041e-5ce1-4c8a-9dc5-406cc98f0a23}'
_extension_dirname=655789
_extension_suffix=-an+fx-linux
pkgname="firefox-extension-mooltipass"
pkgver=1.1.82
pkgrel=1
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('firefox'
         'moolticute')
source=("${pkgname}-${pkgver}${_extension_suffix}.xpi::""https://addons.mozilla.org/firefox/downloads/file/${_extension_dirname}/${_extension_name}-${pkgver}${_extension_suffix}.xpi"
        'LICENSE')
sha256sums=('01269f338ca8a421b5ee449b84945ba4b23ccf873cccdede61e38c04319af830'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${pkgname}-${pkgver}${_extension_suffix}.xpi")

package() {
    cd "${srcdir}"

    install -Dm 644 "${pkgname}-${pkgver}${_extension_suffix}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

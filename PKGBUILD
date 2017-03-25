# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_extension_name='mooltipass'
_extension_id='{da36041e-5ce1-4c8a-9dc5-406cc98f0a23}'
pkgname="firefox-extension-${_extension_name}"
pkgver=1.1.69
pkgrel=1
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('firefox'
         'moolticute')
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/latest/mooltipass-extension/platform:2/addon-748426-latest.xpi"
        'LICENSE')
sha256sums=('a9c694b6d8d78796eaf000ec480b37ef57971fa4bc6e931450053246ede7e5e8'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${pkgname}-${pkgver}.xpi")

package() {
    cd "${srcdir}"

    install -Dm 644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

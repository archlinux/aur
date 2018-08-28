# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>
#
# See view-source:https://addons.mozilla.org/en-US/firefox/addon/mooltipass-extension/versions/
# and look for <p class="install-button">
# https://addons.mozilla.org/firefox/downloads/file/1030833/mooltipass_extension-1.6.2-an+fx-linux.xpi?src=version-history
_extension_name='mooltipass_extension'
_extension_id='{da36041e-5ce1-4c8a-9dc5-406cc98f0a23}'
_extension_dirname=1030833
_extension_suffix=-an+fx-linux
pkgname="firefox-extension-mooltipass"
pkgver=1.6.2
pkgrel=1
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('firefox'
         'moolticute')
source=("${pkgname}-${pkgver}${_extension_suffix}.xpi::""https://addons.mozilla.org/firefox/downloads/file/${_extension_dirname}/${_extension_name}-${pkgver}${_extension_suffix}.xpi"
        'LICENSE')
sha256sums=('f67fb81ef3db30f28200ce114f3e35ea2b89222d1f512deafcfba8598ad8e789'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')
noextract=("${pkgname}-${pkgver}${_extension_suffix}.xpi")

package() {
    cd "${srcdir}"

    install -Dm 644 "${pkgname}-${pkgver}${_extension_suffix}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}.xpi"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

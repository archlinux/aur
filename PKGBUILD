# Maintainer: Quentin Bourgeois <quentin+archlinux@bourgeois.eu>

_extension_name='mooltipass'
_extension_id='ffemldjbbfhimggdkkckolidemlllklk'
_store_base_url='https://clients2.google.com/service/update2/crx?response=redirect&prodversion=49.0&x=id%3D'
pkgname="chromium-extension-${_extension_name}"
pkgver=1.1.62
pkgrel=1
pkgdesc='Retrieve and store Mooltipass credentials easily from websites.'
license=('custom:MIT')
arch=('any')
url='https://www.themooltipass.com/setup'
depends=('chromium')
source=("${_extension_name}.crx::${_store_base_url}${_extension_id}%26installsource%3Dondemand%26uc"
        "${_extension_id}.json"
        'LICENSE')
sha256sums=('31e119a9b5f88f5081794b8da1152b470d0186085b5b7beffeb37d48fa944fc4'
            '3958de07cee049f6dcaef59983735119dcad4090fa7873191e4de8ed4d535dd5'
            '2af680c39ef493fb82830356d1d3df1acb5a06033cba2dec7a19e21caa77a866')

package() {
    cd "${srcdir}"

    install -Dm 644 "${_extension_name}.crx"    \
            "${pkgdir}/usr/lib/${CARCH}-linux-gnu/${_extension_name}-chromium/${_extension_name}.crx"

    install -Dm 644 "${_extension_id}.json"     \
            "${pkgdir}/usr/share/chromium/extensions/${_extension_id}.json"

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

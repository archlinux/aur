# Maintainer: restitux <restitux@ohea.xyz>

_pkgname=pyscript
pkgname=home-assistant-pyscript
pkgver=1.6.1
pkgrel=1
pkgdesc="Pyscript adds rich Python scripting to HASS"
arch=(any)
url="https://github.com/custom-components/pyscript"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver.tar.gz::https://github.com/custom-components/pyscript/archive/${pkgver}.tar.gz")
b2sums=('dcbfb8926774d1821a84c8c8f95bdbb1bedbc1ce79f2aa4af29118f221753c832df62789a723cd8ea301a6ec4a570906a08d584fbc84e70cc5d2b1070e66c27b')


package() {
    cd "$_pkgname-$pkgver"

    find "custom_components/pyscript" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;
    chmod 700 "${pkgdir}/var/lib/private"

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

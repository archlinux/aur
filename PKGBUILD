# Maintainer: restitux <restitux@ohea.xyz>

_pkgname=pyscript
pkgname=home-assistant-pyscript
pkgver=1.5.0
pkgrel=1
pkgdesc="Pyscript adds rich Python scripting to HASS"
arch=(any)
url="https://github.com/custom-components/pyscript"
license=("Apache-2.0")
depends=("home-assistant")
source=("$pkgname-$pkgver.tar.gz::https://github.com/custom-components/pyscript/archive/${pkgver}.tar.gz")
b2sums=('a1cd75d6021a7a1e09cd5e0db9a1e17a1643dab900c2e453e3e03ceb6809f153953dc5b28e0ff8c52f3b5f727adee251035cb3f9ef6f9aa0c286af5bb13163bf')


package() {
    cd "$_pkgname-$pkgver"

    find "custom_components/pyscript" -type f -exec install -vDm 644 {} "${pkgdir}/var/lib/private/hass/"{} \;
    chmod 700 "${pkgdir}/var/lib/private"

    install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm 644 "LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}

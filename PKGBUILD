# Maintainer: Artur <artur@magicgrants.org>
pkgname=skylight-wallet-bin
_pkgname=skylight-wallet
pkgver=1.0.6
pkgrel=1
pkgdesc="A light Monero wallet."
arch=('x86_64')
url="https://github.com/magicgrants/skylight-wallet"
license=('MIT')
depends=('gtk3' 'libsecret')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/magicgrants/skylight-wallet/main/LICENSE")
sha256sums=('6359cb79a08929cc6c7c6861f39b7d44083c948c56ba93b642350b529702eec7'
            '9e5173c28e0a926d43df9b7953174474ea310129d2047564514259b50dc22478')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

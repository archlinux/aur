# Maintainer: Serge K <arch@phnx47.net>

_pkgname=ever-surf
pkgname="${_pkgname}-bin"
pkgver=9.5.0
pkgrel=1
pkgdesc="Everscale Browser"
arch=('x86_64')
url="https://ever.surf/download/"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
depends=('gtk3' 'nss' 'alsa-lib')
_polmd='surf-decentralization-policy.8f8dd506.md'
source=("${_pkgname}-${pkgver}.deb::https://distribution.services.ever.surf/download/flavor/default/${pkgver}-release/linux_64/${_pkgname}_${pkgver}_amd64.deb"
        "${_polmd}::https://ever.surf/static/media/${_polmd}")
sha512sums=('4bc9263e14f8dbdac9055425825a24d68e80e26006acc9222a0aa33f4d1926fb8e94dfbf52c91195bef03cbe437f1754af2b8ed51c0ad848281a93310db25153'
            'd128dd052d4d2b9059d1f1849cf4cce5818ea1effcd60f9c2a26cea0e7f2d46416007ed1429adc726ed2d2ce9675e6390e196aadbe1718cb6abf34d808e2b2c4')

package() {
  tar --no-same-owner -xf data.tar.xz -C "${pkgdir}"
  install -Dm 644 "${_polmd}" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

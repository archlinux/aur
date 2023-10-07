# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=ever-surf
pkgname="${_pkgname}-bin"
pkgver=9.4.2
pkgrel=1
pkgdesc="Everscale Browser"
arch=('x86_64')
url="https://ever.surf/download/"
license=('custom')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_polmd='surf-decentralization-policy.8f8dd506.md'
source=("${_pkgname}-${pkgver}.deb::https://distribution.services.ever.surf/download/flavor/default/${pkgver}-release/linux_64/${_pkgname}_${pkgver}_amd64.deb"
        "${_polmd}::https://ever.surf/static/media/${_polmd}")
sha512sums=('b2adffef6c0bdc2297133372ee93a2941240711328c4a39d8a44dabc9ad5f0d49a8e7c5401bbf2dafc8c4a9bc2d822661addbdb25f72c30b3b01e76d70ca19f0'
            'd128dd052d4d2b9059d1f1849cf4cce5818ea1effcd60f9c2a26cea0e7f2d46416007ed1429adc726ed2d2ce9675e6390e196aadbe1718cb6abf34d808e2b2c4')

package() {
  tar -xf data.tar.xz -C "${pkgdir}"
  install -Dm 644 "${_polmd}" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

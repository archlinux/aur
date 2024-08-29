# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="mangadesk"
pkgname="${_pkgname}-bin"
pkgver=0.7.8
pkgrel=1
pkgdesc="A terminal client for MangaDex"
arch=('x86_64' 'i686')
url="https://github.com/darylhjd/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver//./-}_x64")
source_i686=("${_pkgsrc}-i686::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver//./-}_x32")
sha256sums=('43fc3bd3d6bf52f2ae92cc276a1ac01bd1ac3e75d007b30a6b22f49258d2c35f'
            'e743d91289001adbc103d2a56569846913592ca72f89f4be151a7d056f31ade6')
sha256sums_x86_64=('b2fa020f42182dd4af059b5bd814cdb5d2c62a91a4acd580a33df190982eb86d')
sha256sums_i686=('049f47fe3cdfea6b29809a3a9a5c3729e5776accc23e9979f6fba0767ff8232a')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
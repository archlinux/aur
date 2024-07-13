# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="taierspeed-cli"
pkgname="${_pkgname}-bin"
pkgver=1.7.1
pkgrel=1
pkgdesc="TaierSpeed CLI"
arch=('x86_64' 'aarch64' 'armv7h' 'mips' 'mipsel' 'mips64' 'mips64el')
url="https://github.com/ztelliot/${_pkgname}"
license=("LGPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
source_armv7h=("${_pkgsrc}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7")
# Change 'hardfloat' to 'softfloat' if necessary
source_mips=("${_pkgsrc}-mips::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips_hardfloat")
source_mipsel=("${_pkgsrc}-mipsel::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mipsle_hardfloat")
source_mips64=("${_pkgsrc}-mips64::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64_hardfloat")
source_mips64el=("${_pkgsrc}-mips64el::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_mips64le_hardfloat")
sha256sums=('e5327d58bbba05ebd74c5d9763733b7046f444d468e2d182819967cf7b008284'
            'e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118')
sha256sums_x86_64=('4a1a45ebad89b02b82f24cf7cb9bbd5c4ba878b0dcb4a2dbed2d532770201aa6')
sha256sums_aarch64=('e99642639eb69bc04d0f8d4de6c3de03778a2a3ab9049c4c7db1c0c7abe7b2b5')
sha256sums_armv7h=('87e7b68efa92051ecc8a4f805db05d7f03c18e55539215f90facd7dbc8bc4edc')
sha256sums_mips=('86a7cbdc22d548596e2de6f9aa4aab7a525e8b3958c27e7cf48490eb3eebc67d')
sha256sums_mipsel=('aa87e721814148bbbea8d79c17efb659baf731630f67ef435fecec4ffa0e1f17')
sha256sums_mips64=('46626003e7cfdd0411063691f4b9d8ad7f60ae01ecb7606a5b7ffb60c4a84d7e')
sha256sums_mips64el=('e8508a6d166a680b7e91933e0116c8088751268697ad446f47c4a681481e429c')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="taierspeed-cli"
pkgname="${_pkgname}-bin"
pkgver=1.7.2
pkgrel=1
pkgdesc="TaierSpeed CLI"
arch=('x86_64' 'aarch64' 'armv7h' 'mips' 'mipsel' 'mips64' 'mips64el')
url="https://github.com/ztelliot/${_pkgname}"
license=("LGPL-3.0-or-later")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
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
sha256sums_x86_64=('845b98ca0a9fa72c68ff41eb3943d4a7d7341a8443a7bb425d647d01e0ea08b1')
sha256sums_aarch64=('2315b44ed71350e0b08ffca80514216a52fbc50ca81bf3f4a87b587d3df9503f')
sha256sums_armv7h=('70b03f72249015e04b456a81017999da7191e131ddf97c6e2833f2c12df12054')
sha256sums_mips=('5b1d4f94542546dc01011e4e51df611f3155b3225ef36bffb9182ae6ba44f60c')
sha256sums_mipsel=('b4d66ee075421fe30cc827aa4ec0d462f70da3143dcc8bd5477a7145857291b6')
sha256sums_mips64=('46767ce3c4d0a843e7383908f9b9d0ba8637f7339e663b0018c71ec572a3cacd')
sha256sums_mips64el=('8859b72060fc91d9ae6d3edab956378dfd9e869426e637e769d5dcfb1de4c69b')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

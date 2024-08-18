# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.22.2
pkgrel=1
pkgdesc="HTTP download manager with multi-parts"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/vbauerster/${_pkgname}"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums=('fd0d1dbbdc791ad72461b58d54af5c0e1b4b13b77f7b6833c037a4478cee3db0'
            '05825076a9292282160131e3644317e5977c13c414144e76c6658008c78989cd')
sha256sums_x86_64=('23a74c5b986c09d9ade0b4ebabb5d7afac4505ee5db3a6702add82af4cf3606a')
sha256sums_i686=('150a49b4b97f2c0f480ce055abaa2b1552723923d93ff85d89302e619382b993')
sha256sums_aarch64=('2fdec687efe28b745d947f0f6cfad2725bb6fffb30698076d9ce8337e7fa8d93')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

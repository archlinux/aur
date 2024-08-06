# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.22.1
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
sha256sums=('12a31a9c4e7da16be6baa263a1696f576cda6917ac5b6a33b419ad800a7787b6'
            '05825076a9292282160131e3644317e5977c13c414144e76c6658008c78989cd')
sha256sums_x86_64=('a170d60e2185b47e043c8e60c13bdddbb00c1c94f0e075e1954dd60c2b475446')
sha256sums_i686=('e1feae24b4c214ef0f97af4f6b113268c3f8861dec81cf91ed971fe7f5e5b93d')
sha256sums_aarch64=('ed52f036675576adf415f256863327e4c68e9edc7603fb001c4e8177f063fd75')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

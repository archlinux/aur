# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.21.2
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
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('d3a9dfa9fd22fee10e177d1ae687c3a415d4f8b2ad010d11121c418688efdb2f'
            '05825076a9292282160131e3644317e5977c13c414144e76c6658008c78989cd')
sha256sums_x86_64=('ac89f5e4483ae6f77c73073c0bce121dc8ab38f03a5d7d2a99143025efb456b0')
sha256sums_i686=('5d6dbd04c0c88eaafd42ed9270b6f63d25a5cd665d620a0c20d9aef520aeeb51')
sha256sums_aarch64=('da42984eabcd105ba949303a7e1424c23f61cb402136f8810341fc96d3c0c5bd')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

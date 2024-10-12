# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.22.4
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
sha256sums=('b07fd3cbdd4e4fb7aeb86671ed570d13c96f02529f08a646961ed5d639a555d0'
            '05825076a9292282160131e3644317e5977c13c414144e76c6658008c78989cd')
sha256sums_x86_64=('0c53d9a2e0ff6c7814c4cd64a4c886d3fb24e43d529011e3c5ebf2f2a136e791')
sha256sums_i686=('07bd262104cc3526fdc8078c4dd45f73b725565f73d0746226c3a8c1fc7853f2')
sha256sums_aarch64=('1632ae6e29b6492d7c4715092c4627daa49931f10398182c9972398c19b4e5ab')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

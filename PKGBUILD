# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="getparty"
pkgname="${_pkgname}-bin"
pkgver=1.23.5
pkgrel=1
pkgdesc="HTTP download manager with multi-parts"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/vbauerster/${_pkgname}"
license=('BSD-3-Clause')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums=('5dbfa092831573c2afc347d0feba84c8a759544ce2648b04953947c9edd5ebfc'
            '7eae4b517298f40842bed72893aee2fb1a45ea368e2ad0951bad3c6062608c83')
sha256sums_aarch64=('8ddf64852cd1c1484777bdf0e4de4c0164d851f2b41a620602d9ab85560604b0')
sha256sums_i686=('85633b76da210ab13cd778853c98458bccf4c0e02480f613a6c358fe03ce1a9e')
sha256sums_x86_64=('393499d2ed41d35bbdab6534d9c39c3e2471421a74a524f738cbf5d76199772d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"         "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

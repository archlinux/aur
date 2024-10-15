# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gocloc"
pkgname="${_pkgname}-bin"
pkgver=0.5.3
pkgrel=1
pkgdesc="A little fast CLOC (Count Lines Of Code)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/hhatto/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('aa06bd52c7057e25fc6d76005d4778964e96e2b68d151fb56c62c6943ff359d3')
sha256sums_i686=('7d7d3db9cae049c9322b76646e5660c6b49d3f7fcaa210f728e6668d18b5eb1f')
sha256sums_aarch64=('36ad97c950384abe5852aa0e396213951ceee14a05562ea3a7db5c304ecb8ed0')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

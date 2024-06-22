# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=gocloc
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="A little fast cloc(Count Lines Of Code)"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/hhatto/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('25e39c6b64280678e0f072773846b2afecf803898f3f93cf67c0b5e6d2e8017c')
sha256sums_i686=('a15cad3cff436cdf706aed2b0e8cc1b1119e2c9aa022aa305ce7720eaca11b39')
sha256sums_aarch64=('4ba6de50c3f9f83542ac629ec3d2d716b8131163c98f1cf1c05eb70733e22541')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
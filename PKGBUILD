# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gocloc"
pkgname="${_pkgname}-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="A little fast CLOC (Count Lines Of Code)"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/hhatto/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('d58cd4bdc74ade751bc682cef7e10a265c65e2059b11f596f3868ad43c2276f2')
sha256sums_i686=('a11a0370ba5bfe098c561ea170cd40a348e51f8de69fb2966526cffa08fa8e55')
sha256sums_x86_64=('2fb210585430f3185923ae77fff555e2960101287fdc28af50a9dac6033ea9c5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="yai"
pkgname="${_pkgname}-bin"
pkgver=0.6.0
pkgrel=1
pkgdesc="Your AI powered terminal assistant"
arch=('x86_64' 'aarch64' 'i686' 'armv6h')
url="https://ekkinox.github.io/yai"
_url="https://github.com/ekkinox/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${_url}/releases/download/${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
sha256sums_x86_64=('aaa88b3b5222fca3090f7d3fc04bc2c07f174055f68618800e7333c9afd323b5')
sha256sums_aarch64=('79ba33f268cfa8fa12171b9cc4420da80ad67baea31e6bcfb0d021f738193c85')
sha256sums_i686=('93cc10dec1af0ff622b533c6b81072e417da656aab04cde7ba57cf915c16312a')
sha256sums_armv6h=('e2826fb28bf03c1682b6a9d543646c5239e6ceba2ab77a8f6808d35e56d3ff97')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

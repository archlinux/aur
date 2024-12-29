# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="tex-fmt"
pkgname="${_pkgname}-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc="An extremely fast LaTeX formatter written in Rust"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/WGUNDERWOOD/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-armv7hf-linux.tar.gz")
sha256sums=('21ce9874a69b9508653b82313e1f804837255b8ef739788a75aae19ec7abbbc3'
            'd909d9843225ff2ccec3a74f3b13c889fb0bfabb7b3801dcad68505a872c941d')
sha256sums_x86_64=('7831c0d2f52f2ef297a2b382426b49f56eb93eafae262b3217460a57413e91d1')
sha256sums_aarch64=('8fd4a347e9a16e69dfae342253b08563b8c8206a6d93910f0c4e6fe522e2b5d9')
sha256sums_armv7h=('96abe7bff30ed094bd87a5d90831aa5339dafffea7440fde49b61f855c0aa626')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

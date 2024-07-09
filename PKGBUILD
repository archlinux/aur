# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="vault-unseal"
pkgname="${_pkgname}-bin"
pkgver=0.5.1
pkgrel=1
pkgdesc="Auto-unseal utility for Hashicorp Vault"
arch=('x86_64' 'aarch64' 'armv6h')
url="https://github.com/lrstanley/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/"{README.md,LICENSE})
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
source_aarch64=("${_pkgsrc}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64")
source_armv6h=("${_pkgsrc}-armv6h::${url}/releases/download/v${pkgver}/${_pkgname}_linux_armv6")
sha256sums=('e35c5b1a03e4b01dc9b7c70e9c52e9a2dc9cc7e8939cedea985018a35df1e939'
            'd040ad47a68cd4a002e148921ee7adaed03ae27e56f7911087de3a928d3af0e3')
sha256sums_x86_64=('f1a98f4af61efd252f1eea803e88499c04261a4704bb87bd66e48be70044f77f')
sha256sums_aarch64=('863684fb963055a8fe047b2fcd303b0fe4bef4702344381d4f0a088acff2ca42')
sha256sums_armv6h=('3f171449824da3bdd63b3527407eef1d0558246a4ec9f97e5b33c5b89ed13b16')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers and on keybase (dbrgn)
pkgname=tealdeer-bin
_pkgname=tealdeer
_binname=tldr
pkgver=1.2.0
pkgrel=1
pkgdesc="A very fast tldr client in Rust. Static binaries from GitHub."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/dbrgn/tealdeer/"
license=('MIT' 'Apache')
provides=('tldr')
validpgpkeys=('EA456E8BAF0109429583EED83578F667F2F3A5FA')
source=(
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_bash"
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_fish"
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/LICENSE-MIT"
)
source_x86_64=(
  "${pkgname}-x86_64::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-x86_64-musl"
  "${pkgname}-x86_64.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-x86_64-musl.sig"
)
source_i686=(
  "${pkgname}-i686::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-i686-musl"
  "${pkgname}-i686.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-i686-musl.sig"
)
source_arm=(
  "${pkgname}-arm::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabi"
  "${pkgname}-arm.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabi.sig"
)
source_armv6h=(
  "${pkgname}-armv6h::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabihf"
  "${pkgname}-armv6h.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabihf.sig"
)
source_armv7h=(
  "${pkgname}-armv7h::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-armv7-musleabihf"
  "${pkgname}-armv7h.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-armv7-musleabihf.sig"
)
sha256sums=(
  'd364816b0a9540684f0d7010a256b21675fac6a597b7839bac09b08f8fdb6758'
  'a2390bbd6af37a4731ce0a83b29e5e51838df93552f4615fbb414bb0783ddf76'
  'e3a3f0f44838492b3f0303aad7d929424517467ff82d2db5a3038639422e0db0'
)
sha256sums_x86_64=('65d74fb346969017993bef969d4193576ef0f94daae050d6f2bb9d5d6b98d33c' 'SKIP')
sha256sums_i686=('c86b1b481496df67b43e181e2701edd5c821a2130bad4a96b7c472119c84f7a4' 'SKIP')
sha256sums_arm=('1bdaa21b82528363d1c1be9f1ad2ec971d34e063f0fb6488e65c685041f78ea9' 'SKIP')
sha256sums_armv6h=('2f0a6bc24cdc83ceafc1c09cc5cae4bf189deac7074be5eb34365d9ca5490484' 'SKIP')
sha256sums_armv7h=('023ee6650cf132300320251a254346806e6cb7c01d695f0f881122ba9acd0cb6' 'SKIP')

package() {
  # Install binary
  install -Dm 755 "${srcdir}/${pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_binname}"

  # Install MIT license
  install -Dm 644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # Install shell completions
  install -Dm644 completions_bash "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 completions_fish "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
}

# vim:set ts=2 sw=2 et:

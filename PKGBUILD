# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers and on keybase (dbrgn)
pkgname=tealdeer-bin
_pkgname=tealdeer
_binname=tldr
pkgver=1.4.0
pkgrel=2
pkgdesc="A fast tldr client in Rust. Static binaries from GitHub."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/dbrgn/tealdeer/"
license=('MIT' 'Apache')
provides=('tldr')
conflicts=('tldr')
validpgpkeys=('EA456E8BAF0109429583EED83578F667F2F3A5FA')
source=(
  "completions_bash_v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_bash"
  "completions_fish_v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_fish"
  "completions_zsh_v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_zsh"
  "LICENSE-MIT-v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/LICENSE-MIT"
)
source_x86_64=(
  "${pkgname}-x86_64-v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-x86_64-musl"
  "${pkgname}-x86_64-v${pkgver}.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-x86_64-musl.sig"
)
source_i686=(
  "${pkgname}-i686-v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-i686-musl"
  "${pkgname}-i686-v${pkgver}.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-i686-musl.sig"
)
source_arm=(
  "${pkgname}-arm-v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabi"
  "${pkgname}-arm-v${pkgver}.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabi.sig"
)
source_armv6h=(
  "${pkgname}-armv6h-v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabihf"
  "${pkgname}-armv6h-v${pkgver}.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-arm-musleabihf.sig"
)
source_armv7h=(
  "${pkgname}-armv7h-v${pkgver}::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-armv7-musleabihf"
  "${pkgname}-armv7h-v${pkgver}.sig::https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/tldr-linux-armv7-musleabihf.sig"
)
sha256sums=(
  'd867f58919431a1097237c5a8118cf4dcb01aadf960f61eddd432bf63050971d'
  '5fdf3346a03157f9a43f42e5d475611cce6b3685badf1084db2587f2ce425931'
  '0bdbd3940fba926c8b40c02fb62a2a60e2a3169d44b17398a6c905dad58d6b6d'
  'e1a85727599c145ad026ff8b41c49c55b9bc98e859569535814a70980e6ba709'
)
sha256sums_x86_64=('c8c48e80b5569808064cdfebbc416c8f5001d9a6f470b04bb03832fb2378cf9c' 'SKIP')
sha256sums_i686=('1667481f7e50e5b04a4f69bd75a32559e1ae9de9c40ab2edd39dfc849aff9ca5' 'SKIP')
sha256sums_arm=('d8d95c3f14bed103835824ca64b072fcfa49a30e5ed3d69fe69bdaa6fdd4a125' 'SKIP')
sha256sums_armv6h=('6834708bb2518b1af03e8d95a679693ddb683a73ad65ce28b6b60e800d492266' 'SKIP')
sha256sums_armv7h=('30d11cf14de3030eace035dea79f1690bf95cf64669db189e189f75ef6da8caa' 'SKIP')

package() {
  # Install binary
  install -Dm 755 "${srcdir}/${pkgname}-${CARCH}-v${pkgver}" "${pkgdir}/usr/bin/${_binname}"

  # Install MIT license
  install -Dm 644 "${srcdir}/LICENSE-MIT-v${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # Install shell completions
  install -Dm644 "completions_bash_v${pkgver}" "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 "completions_fish_v${pkgver}" "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -Dm644 "completions_zsh_v${pkgver}" "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
}

# vim:set ts=2 sw=2 et:

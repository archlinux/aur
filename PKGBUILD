# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers and on keybase (dbrgn)
pkgname=tealdeer-bin
_pkgname=tealdeer
_binname=tldr
pkgver=1.4.0
pkgrel=1
pkgdesc="A fast tldr client in Rust. Static binaries from GitHub."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url="https://github.com/dbrgn/tealdeer/"
license=('MIT' 'Apache')
provides=('tldr')
conflicts=('tldr')
validpgpkeys=('EA456E8BAF0109429583EED83578F667F2F3A5FA')
source=(
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_bash"
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_fish"
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/completions_zsh"
  "https://github.com/dbrgn/${_pkgname}/releases/download/v${pkgver}/LICENSE-MIT"
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
  '34eafba569227165f63ae3f3f4752ec90838dcf4676c8f22593c8f9d420d1cfe'
  '3dc648783449ad976fcd13627f520dacf3ec03dc54e7145eee9157df42a2584a'
  'ca60e5bd42c9e4ff6830ecbaa3c8f3bdd6b0596aa37395d282dcfeacaeb1196e'
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
  install -Dm 644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # Install shell completions
  install -Dm644 completions_bash "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 completions_fish "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -Dm644 completions_zsh "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
}

# vim:set ts=2 sw=2 et:

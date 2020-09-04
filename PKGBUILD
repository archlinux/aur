# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers and on keybase (dbrgn)
pkgname=tealdeer-bin
_pkgname=tealdeer
_binname=tldr
pkgver=1.4.1
pkgrel=1
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
  '56cad3fdd615c040ded73de1e75342156e903a501806b487b526dce1980ae284'
  'e1a85727599c145ad026ff8b41c49c55b9bc98e859569535814a70980e6ba709'
)
sha256sums_x86_64=('36ef9b50071cdeb892cb14f3fecf6beb707fca2b50d10ec5a8cdd31b2c0118f7' 'SKIP')
sha256sums_i686=('98a672d03b546cf7ef1a93ed2e5fff356dfaa71048b8167eb6f75a093b3e47be' 'SKIP')
sha256sums_arm=('7a95eb72fe35ee88b06908041260592f341154460614147d86f201ea528a0651' 'SKIP')
sha256sums_armv6h=('e9506692d4d68ec427d06b873ec0f9eeec18c64bef9cac7bbe829e2a5f0530c4' 'SKIP')
sha256sums_armv7h=('2cde727edf5197675ff14ec44dee8de9a6fad42086cc9578d5b35b8b08b4cd61' 'SKIP')

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

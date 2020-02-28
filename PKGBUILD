# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
# PGP key is on keyservers and on keybase (dbrgn)
pkgname=tealdeer-bin
_pkgname=tealdeer
_binname=tldr
pkgver=1.3.0
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
  '34eafba569227165f63ae3f3f4752ec90838dcf4676c8f22593c8f9d420d1cfe'
  '3dc648783449ad976fcd13627f520dacf3ec03dc54e7145eee9157df42a2584a'
  'ca60e5bd42c9e4ff6830ecbaa3c8f3bdd6b0596aa37395d282dcfeacaeb1196e'
  'e1a85727599c145ad026ff8b41c49c55b9bc98e859569535814a70980e6ba709'
)
sha256sums_x86_64=('cbc0c946efa4c05244169f2b099dafcc941bf6d7870d041a6c7c3edd60405e72' 'SKIP')
sha256sums_i686=('7f114e912fa827a97b4a58997e3083e42754912ca6e62ca736fed4c8a26cfba4' 'SKIP')
sha256sums_arm=('664f4154dc892ecda90e5af2b499735678763668b9d7d31c1ec8543ef4ed8d7d' 'SKIP')
sha256sums_armv6h=('491981197da8169f98dac261ef1f84373effada8b13c14fc35b8f6122e818d1b' 'SKIP')
sha256sums_armv7h=('036d55b25eb5a4320a1c8890ba34fc95fa370e89541751249e9a0a07d5372790' 'SKIP')

package() {
  # Install binary
  install -Dm 755 "${srcdir}/${pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_binname}"

  # Install MIT license
  install -Dm 644 "${srcdir}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"

  # Install shell completions
  install -Dm644 completions_bash "${pkgdir}/usr/share/bash-completion/completions/${_binname}"
  install -Dm644 completions_fish "${pkgdir}/usr/share/fish/completions/${_binname}.fish"
  install -Dm644 completions_zsh "${pkgdir}/usr/share/zsh/site-functions/_${_binname}"
}

# vim:set ts=2 sw=2 et:

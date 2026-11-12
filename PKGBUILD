# Maintainer: shbernal <shbernal.01@gmail.com>
# Issues and fixes: https://github.com/shbernal/aur-packages

_pkgname=remder
pkgname=${_pkgname}-bin
pkgver=1.0.1
pkgrel=1
pkgdesc='Render your markdown in the terminal with lots of bells and whistles'
arch=('x86_64' 'aarch64')
url='https://github.com/Keyboard1000n17/remder'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# Bun single-file executable: stripping drops the embedded app
options=('!strip' '!debug')

_release="${url}/releases/download/${_pkgname}-v${pkgver}"
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${_release}/${_pkgname}-linux-x64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${_release}/${_pkgname}-linux-arm64")
sha256sums_x86_64=('d99ceeacefa214f86561384f315fd3c1f9b24fb0283a5dadd9b4acecc5a1cfcb')
sha256sums_aarch64=('13afcb79363bd5b6076ac5392d4bedb0ce8c0a5df26ecbd02843671d72ad3c9b')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}

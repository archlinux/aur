# Maintainer: REPLACE Before Publishing <your.name at example dot com>

pkgname=ratune-bin
pkgver=0.9.8
pkgrel=1
pkgdesc='Terminal music player for Subsonic-compatible servers (prebuilt binary)'
url='https://github.com/acmagn/ratune'
arch=('x86_64')
license=('MIT')
provides=('ratune')
conflicts=('ratune')
depends=('alsa-lib' 'openssl' 'zlib' 'brotli' 'zstd' 'gcc-libs')
optdepends=(
  'fzf: library fuzzy picker'
  'skim: library fuzzy picker (sk)'
)
options=('!strip' '!debug')
_pkgname=ratune

source=(
  "${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/acmagn/ratune/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
  "${_pkgname}-LICENSE::https://raw.githubusercontent.com/acmagn/ratune/v${pkgver}/LICENSE"
)

sha256sums=(
  '7b38fcda83cbb9d2cdfc3b1f7445528665d80f5f219ca76dc0851f0cea28dca4'
  '553ae423a213082d16544f2ba650ac94275097dcce94609054e879a31a526950'
)







package() {
  install -Dm755 "${srcdir}/ratune" "${pkgdir}/usr/bin/ratune"
  install -Dm644 "${srcdir}/${_pkgname}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

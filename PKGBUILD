# Maintainer: MiguelRegueiro

pkgname=elio-bin
_pkgname=elio
pkgver=1.1.0
pkgrel=1
pkgdesc='Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support (prebuilt binary)'
arch=('x86_64')
url='https://github.com/elio-fm/elio'
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}=${pkgver}")
conflicts=('elio')
optdepends=(
  'poppler: PDF metadata and rendered page previews'
  'ffmpeg: audio/video metadata, artwork, thumbnails, and ffprobe support'
  'resvg: SVG rasterization'
  '7zip: archive and comic archive preview fallback'
  'libarchive: archive and ISO listing fallback through bsdtar'
)
source=("${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('91a1136374cf66e4693ccb1802619292a1b189adfaff1a463eb75260b0660b61')

package() {
  cd "${_pkgname}-${pkgver}-x86_64-unknown-linux-gnu"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

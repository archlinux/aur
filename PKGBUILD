# Maintainer: duanluan <duanluan@outlook.com>

pkgname=emeditor-wine
pkgver=26.1.1
pkgrel=2
pkgdesc='EmEditor text editor running through Wine'
arch=('x86_64')
url='https://www.emeditor.com/'
license=('custom:proprietary')
depends=(
  'bash'
  'noto-fonts-cjk'
  'wine'
  'xorg-xrandr'
  'xorg-xrdb'
)
optdepends=(
  'winetricks: optional Wine prefix tuning'
)
options=('!strip')
_msi="emed64_${pkgver}.msi"
source=(
  "${_msi}::https://download.emeditor.com/${_msi}"
  'emeditor-wine.sh'
  'emeditor-wine.desktop'
)
sha256sums=(
  'bc54ae3700a657c159f176b8f5ad646a4cfef3090d8097ff8dfa99067340f5b5'
  'c3f95dcfb34d26be4786105d39246b8de6a88e9437fac112edd5fe54b9b31663'
  'da053ee4741dada7f257eebe4697d3a438553c529c63c4f0c0cf04b128128f8b'
)

package() {
  install -Dm644 "${srcdir}/${_msi}" \
    "${pkgdir}/usr/share/${pkgname}/${_msi}"
  install -Dm755 "${srcdir}/emeditor-wine.sh" \
    "${pkgdir}/usr/bin/emeditor-wine"
  install -Dm644 "${srcdir}/emeditor-wine.desktop" \
    "${pkgdir}/usr/share/applications/emeditor-wine.desktop"
}

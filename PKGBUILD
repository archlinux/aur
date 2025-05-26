# Maintainer: Mateus Honorato

pkgname=uefitool-bin
pkgver=A71
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor'
arch=('x86_64')
url="https://github.com/LongSoft/UEFITool"
license=('BSD')
provides=("uefiextract=${pkgver}" "uefifind=${pkgver}" "uefitool=${pkgver}")
depends=('qt6-base')
source=(
  "UEFIExtract-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIExtract_NE_${pkgver}_x64_linux.zip"
  "UEFIFind-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFIFind_NE_${pkgver}_x64_linux.zip"
  "UEFITool-${pkgver}.zip::${url}/releases/download/${pkgver}/UEFITool_NE_${pkgver}_x64_linux.zip"
  "UEFITool.desktop"
  "uefitool_32x32.png"
  "uefitool_48x48.png"
  "uefitool_64x64.png"
  "uefitool_128x128.png"
  "uefitool_256x256.png"
  "uefitool_512x512.png"
)
sha256sums=(
  '55cf07b59fb5bf7d219851d4e4418bf75988d959491f9bea7254cb0e983e19ea'
  '19d7031edb5abc2777a04a6fd0ebb09d4ec446ae88b0f074683590e8ebd14ca5'
  'a163db8e3898a4d02f09f0b89a4ff931180bf201941d1e556e76a3aae92daa57'
  'bb0d0c10ff1a860ded6c2f2c09d3aa3fe8f7ef77ecd88b42a4cf893f8d8cfc5b'
  '9b6bce56fcccea4104642c6c8d393e6043671a8fd45b1c7bf8495407b4ad206a'
  'ed001d549f96e142fd609e9a89d3482702d9d37abfa3f6a39cfa0fd2a9b36335'
  '6b82394411bdc2a2b62f18056f07f6f29a651c6f542cfd132db0ba255e05242e'
  '20e1cf7fe9e7b429a2daa0b75e17f4d0f362d1312401c6178658fd9fdb69dc14'
  'c75715b87263f3663bdc60bd0ee1dcbb374a688931018f04d767ea3cfc965bf7'
  '33ace8f0eb8f7c4f6918e9a3033d676293b4decd0fa5ca28987818a63e0ecf1b'
)

package() {
  # Binaries
  install -Dm755 "${srcdir}"/uefiextract "${pkgdir}/usr/bin/uefiextract"
  install -Dm755 "${srcdir}"/uefifind "${pkgdir}/usr/bin/uefifind"
  install -Dm755 "${srcdir}"/uefitool "${pkgdir}/usr/bin/uefitool"

  # Desktops
  mkdir -p "$pkgdir"/usr/share/applications
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 32x32 48x48 64x64 128x128 256x256 512x512; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    cp uefitool_${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/$i/apps/uefitool.png
  done
}
# vim:set ts=2 sw=2 et:

# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ffmate-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Automation layer on top of FFmpeg for video and audio transcoding"
arch=('x86_64' 'aarch64')
url="https://github.com/welovemedia/ffmate"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ffmate_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ffmate_Linux_arm64.tar.gz")
sha256sums_x86_64=('d24c8f66ebc16c9a0e78e73b88438a553c0efe34cab8cc404bdec7174e87bfd9')
sha256sums_aarch64=('4dc0e0ed759955bf5040a24edae51264a485d8d0c2da2ecbaed41918aa261b7a')

package() {
  install -Dm755 "ffmate" "${pkgdir}/usr/bin/ffmate"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>

pkgname=naps2-bin
pkgver=7.0.8
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=(x86_64)
url="https://www.naps2.com"
license=(GPL2)
depends=(sane)
optdepends=(
  'sane-airscan: airscan support'
)
options=(!strip)
source_x86_64=("https://github.com/cyanfish/naps2/releases/download/v7.0b8/naps2-7.0b8-linux-x64.deb")
b2sums_x86_64=('54f953cb8a7994a3e29fbcf97723d672b9356aa650f11581a9d10b4a0ce96dfefad07e75959bb2d880422f2e14de1d4eec7203acc94b56449d3c208086fc0298')

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix directory permissions
  find . -type d -exec chmod -v 0755 {} \;
}

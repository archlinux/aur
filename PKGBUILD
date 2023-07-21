# Maintainer: Ramadan Ali (alicavus) <rot13: ezqa@ezqa.ny>

pkgname=naps2-bin
pkgver=7.0.9
pkgrel=1
pkgdesc="NAPS2 - Not Another PDF Scanner. Scan documents to PDF and more, as simply as possible."
arch=(x86_64)
url="https://www.naps2.com"
license=(GPL2)
depends=(sane)
optdepends=(
  "sane-airscan: airscan support"
)
provides=(${pkgname%-bin})
options=(!strip)
source_x86_64=("https://github.com/cyanfish/naps2/releases/download/v7.0b9/naps2-7.0b9-linux-x64.deb")
b2sums_x86_64=("72e339b0cc1d25e3ed701f9e09285530c5304860bbd536b39b48f6968b971f8ddb1cabbfc21f5888886f376de92dd8998b71767fd06a39488da31dbcfd66b66b")

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # Fix directory permissions
  find . -type d -exec chmod -v 0755 {} \;
}

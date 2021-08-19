pkgname=litecoin-bin
pkgver=0.18.1
pkgrel=1
arch=(i686 x86_64)
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release (includes litecoin-qt and litecoind)"
source=(
  litecoin-bin.desktop
  litecoin128.png
)
sha256sums=(
  '512d0d7de9be2736e4a2d7bf948d16b61319b2c402c032be7c4d3acc06febe16'
  'fc2fa6b980a34762a8135168a4446887223ae60b24da54253893ff517992ad94'
)
source_i686=("https://download.litecoin.org/litecoin-${pkgver}/linux/litecoin-${pkgver}-i686-pc-linux-gnu.tar.gz"{,.asc})
source_x86_64=("https://download.litecoin.org/litecoin-${pkgver}/linux/litecoin-${pkgver}-x86_64-linux-gnu.tar.gz"{,.asc})
sha256sums_i686=('0a2788d58bd22c3754927e216bf18c64145b9fdc0d709f3f49ba3040b876a066' 'SKIP')
sha256sums_x86_64=('ca50936299e2c5a66b954c266dcaaeef9e91b2f5307069b9894048acf3eb5751' 'SKIP')
validpgpkeys=(
  '59CAF0E96F23F53747945FD4FE3348877809386C'  # Adrian Gallagher (thrasher)
)
options=('!strip')
depends=(
  bzip2
  expat
  fontconfig
  freetype2
  gcc-libs
  glib2
  glibc
  graphite
  harfbuzz
  libpng
  libx11
  libxau
  libxcb
  libxdmcp
  pcre
  zlib
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})

package() {
  install -Dm755 litecoin-$pkgver/bin/*litecoin* -t "$pkgdir/usr/bin"
  install -Dm644 litecoin-$pkgver/share/man/man1/litecoin* -t "$pkgdir/usr/share/man/man1"
  install -Dm644 litecoin-bin.desktop "$pkgdir"/usr/share/applications/litecoin-bin.desktop
  install -Dm644 litecoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
}

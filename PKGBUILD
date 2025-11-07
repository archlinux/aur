pkgdesc="FLIR GenTL producer interface that enables the user to enumerate, communicate and stream from FLIR GigE Vision and USB3 Vision devices in a generic way independent from the underlying transport technology. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='libspinnaker'
pkgver='4.2.0.88'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libgentl
    libusb
)

source=("${pkgname}-${pkgver}.deb::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinnaker-${pkgver}-amd64/libspinnaker_${pkgver}_amd64.deb")
sha256sums=('eb9e832b4645c66a8a56743d0c9479f843073e9e9ad0dd3f12d13c66e597113c')

package() {
    # Extract data
    bsdtar -xf data.tar.zst -C "$pkgdir/"
    rm -rf "$pkgdir/usr/share/doc"
}

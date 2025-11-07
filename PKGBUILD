pkgdesc="This package contains an image capture application used to communicate with FLIR digital cameras. This package contains shared libraries."
url='https://www.flir.com/'

pkgname='spinview-qt'
pkgver='4.2.0.88'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    cuda-tools
    hicolor-icon-theme
    intel-oneapi-basekit
    libspinnaker
    libspinvideo
    qt5-base
    qt5-tools
    ffmpeg
)

source=("${pkgname}-${pkgver}.deb::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinnaker-${pkgver}-amd64/spinnaker_${pkgver}_amd64.deb")
sha256sums=('282959ec837744de8fccd08332fa7a29dc54a9d8783dbd180a4ccf9c2dc83e0f')

package() {
    # Extract data
    bsdtar -xf data.tar.zst -C "$pkgdir/"
    rm -rf "$pkgdir/usr/share/doc"
}

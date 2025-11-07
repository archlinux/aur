pkgdesc="A library used to communicate with FLIR digital cameras. This package contains shared libraries"
url='https://www.flir.com/'

pkgname='libspinvideo'
pkgver='4.2.0.88'
arch=('x86_64')
pkgrel=1
license=("custom:FLIR EULA")

depends=(
    libspinnaker
)

source=("${pkgname}-${pkgver}.deb::https://github.com/daizhirui/spinnaker-sdk-arch/raw/main/spinnaker-${pkgver}-amd64/libspinvideo_${pkgver}_amd64.deb")
sha256sums=('7ed5c95099e309c01742dc6027fcdd8e1123db933ddad67029f9933cd4048c68')

package() {
    # Extract data
    bsdtar -xf data.tar.zst -C "$pkgdir/"
    rm -rf "$pkgdir/usr/share/doc"
}

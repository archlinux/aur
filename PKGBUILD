# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

pkgname=webcamoid
pkgver=8.0.0
pkgrel=1
pkgdesc="Webcamoid is a full featured webcam capture application."
url='https://webcamoid.github.io/'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('qt5-quickcontrols'
         'qt5-svg')
optdepends=('v4l-utils: Extra formats support for webcams'
            'v4l2loopback-dkms: Virtual camera support'
            'ffmpeg: Video playing/recording/conversion (Recommended)'
            'gst-plugins-base: Video playing/recording/conversion'
            'gst-plugins-good: Video playing/recording/conversion'
            'gst-plugins-bad: Video playing/recording/conversion'
            'gst-plugins-ugly: Video playing/recording/conversion'
            'libpulse: Audio playback (Recommended)'
            'alsa-lib: Audio playback'
            'jack: Audio playback'
            'kde-cli-tools: Root privileges for virtual camera module (Recommended)'
            'gksu: Root privileges for virtual camera module')
makedepends=('v4l-utils'
             'qt5-tools'
             'ffmpeg'
             'gst-plugins-base-libs'
             'libpulse'
             'alsa-lib'
             'jack')
provides=('webcamoid')
install="${pkgname}.install"
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('85a30805f969b76ec78b47fa1f6901c4f1d0f2c5ca8ecf406dca91c0bede0df1')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    qmake-qt5 Webcamoid.pro
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}

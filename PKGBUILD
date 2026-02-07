# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-vertical-canvas-bin
pkgver=1.6.2
pkgrel=1
pkgdesc="A plugin for OBS Studio that allows you to simultaneously launch two streams with different side resolutions and different source layout."
arch=('x86_64')
url="https://github.com/Aitum/obs-vertical-canvas"
license=('GPL-2.0-or-later')
depends=('obs-studio')
provides=("obs-vertical-canvas")
conflicts=("obs-vertical-canvas")
source=(${pkgname}-${pkgver}.deb::https://github.com/Aitum/obs-vertical-canvas/releases/download/${pkgver}/vertical-canvas-linux-gnu.deb)
sha512sums=('0bd719850528cda14ed929f6c7aa1eca23954c0df9c6796f8ba51761daefc264d778feca379b25c588a007e33e163063fd4793f200daaab9b9d2d38c66ef04d8')

prepare(){
  ar x "${pkgname}-${pkgver}.deb"
  tar xf data.tar.gz
}

package() {
    install -Dm755 "${srcdir}/usr/lib/x86_64-linux-gnu/obs-plugins/vertical-canvas.so" \
        "${pkgdir}/usr/lib/obs-plugins/obs-vertical-canvas.so"

    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/"
    cp -r "${srcdir}/usr/share/obs/obs-plugins/vertical-canvas" \
        "${pkgdir}/usr/share/obs/obs-plugins/"
}

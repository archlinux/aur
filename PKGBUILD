# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-vertical-canvas-bin
pkgver=1.6.6
pkgrel=1
pkgdesc="A plugin for OBS Studio that allows you to simultaneously launch two streams with different side resolutions and different source layout."
arch=('x86_64')
url="https://github.com/Aitum/obs-vertical-canvas"
license=('GPL-2.0-or-later')
depends=('obs-studio')
provides=("obs-vertical-canvas")
conflicts=("obs-vertical-canvas")
source=(${pkgname}-${pkgver}.deb::https://github.com/Aitum/obs-vertical-canvas/releases/download/${pkgver}/vertical-canvas-ubuntu-26.04.deb)
sha512sums=('3a49b83716114f7a9e84b083fab2b319733b8dd8be77da9106de8425bbb55c4dcb09f2777a72f85b553cfb5da09b25351519b311ee07af9756d265b2adc9c9ae')

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

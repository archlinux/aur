# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-vertical-canvas-bin
pkgver=1.6.5
pkgrel=1
pkgdesc="A plugin for OBS Studio that allows you to simultaneously launch two streams with different side resolutions and different source layout."
arch=('x86_64')
url="https://github.com/Aitum/obs-vertical-canvas"
license=('GPL-2.0-or-later')
depends=('obs-studio')
provides=("obs-vertical-canvas")
conflicts=("obs-vertical-canvas")
source=(${pkgname}-${pkgver}.deb::https://github.com/Aitum/obs-vertical-canvas/releases/download/${pkgver}/vertical-canvas-ubuntu-26.04.deb)
sha512sums=('da3f5d920a2ab457f739a71678a739521273d38f427717730f913ee371da1ce103602de6da6ef5faccfa795f47738ca900531b43e49ed196e491fde58b6316e3')

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

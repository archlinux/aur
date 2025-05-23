# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.7.1
pkgrel=1
pkgdesc='Multiple RTMP outputs plugin for OBS Studio.'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.0-x86_64-linux-gnu.deb")
sha256sums=('5bfdd00b5c5e6e05fb64672e387170d4acac38a64848e9616b8e1208ae45e3f2')

prepare() {
    cd "${srcdir}"

    bsdtar -xf data.tar.gz
}

package() {
    cd "${pkgdir}"

    mkdir -p usr/lib/obs-plugins
    mkdir -p usr/share/obs/obs-plugins/obs-multi-rtmp

    cp -a "${srcdir}"/usr/lib/x86_64-linux-gnu/obs-plugins/* usr/lib/obs-plugins
    cp -a "${srcdir}"/usr/share/obs/obs-plugins/obs-multi-rtmp/* usr/share/obs/obs-plugins/obs-multi-rtmp
}

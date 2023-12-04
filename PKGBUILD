# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.5.0.4
pkgrel=2
pkgdesc='Multiple RTMP outputs plugin for OBS Studio.'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
source=("${url}/releases/download/${pkgver}-flatpak/${pkgname}-${pkgver}-x86_64-linux-gnu.tar.xz")
sha256sums=('725c8d4b92946801e4b7e61e712cc40536f13a48719400d5802f3a34dbbae5c7')

package() {
    cd "${pkgdir}" || exit 1

    mkdir -p usr/lib/obs-plugins
    mkdir -p usr/share/obs/obs-plugins/obs-multi-rtmp

    prefix="${srcdir}/obs-multi-rtmp"
    cp -a "${prefix}/bin/64bit/"* usr/lib/obs-plugins
    cp -a "${prefix}/data/"* usr/share/obs/obs-plugins/obs-multi-rtmp
}

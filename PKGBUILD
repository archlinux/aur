# Maintainer: Jat <chat@jat.email>

pkgname=obs-multi-rtmp
pkgver=0.3.0.2
pkgrel=2
pkgdesc='Multiple RTMP outputs plugin'
arch=('x86_64')
url='https://github.com/sorayuki/obs-multi-rtmp'
license=('GPL')
depends=('obs-studio')
# remove '-OBS29.1.1' in next version
source=("${url}/releases/download/${pkgver}-OBS29.1.1/${pkgname}-${pkgver}-linux-x86_64.deb")
sha256sums=('46f75b73dff460b857753bdd5ad0b546380493bf15e4ed274753f95253192edf')

package() {
    cd "${srcdir}"
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}"
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}

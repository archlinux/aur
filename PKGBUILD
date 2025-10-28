# Maintainer: Thomas Ludwig <business at tludwig dot dev>

pkgname=obs-source-profiler-bin
pkgver=0.0.9
pkgrel=1
pkgdesc="A profiler for the sources in OBS."
arch=('x86_64')
url="https://github.com/exeldro/obs-source-profiler"
license=('GPL-2.0-or-later')
depends=('obs-studio')
provides=("obs-source-profiler")
conflicts=("obs-source-profiler")
source=(${pkgname}-${pkgver}.deb::https://github.com/exeldro/obs-source-profiler/releases/download/${pkgver}/source-profiler-${pkgver}-${arch}-linux-gnu.deb )
sha256sums=("SKIP")

prepare(){
  ar x "${pkgname}-${pkgver}.deb"
  tar xf data.tar.gz
}

package() {
    install -Dm755 "${srcdir}/usr/lib/x86_64-linux-gnu/obs-plugins/source-profiler.so" \
        "${pkgdir}/usr/lib/obs-plugins/source-profiler.so"

    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/"
    cp -r "${srcdir}/usr/share/obs/obs-plugins/source-profiler" \
        "${pkgdir}/usr/share/obs/obs-plugins/"
}

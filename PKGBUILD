# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: David Mazieres (http://www.scs.stanford.edu/~dm/addr/)

_pkgname="droidcam-obs-plugin"
pkgname="${_pkgname}-bin"
pkgver="1.5.1"
pkgrel="1"
pkgdesc="plugin for droidcam obs"
arch=("x86_64" "i686")
url="https://dev47apps.com/obs/"
license=('GPL')
depends=("obs-studio" 'libusbmuxd')
makedepends=('libjpeg-turbo')
conflicts=("${pkgname}-git")
source=("https://files.dev47apps.net/obs/droidcam_obs_${pkgver}_linux.zip" "ja-JP.ini")
sha256sums=('SKIP' "SKIP")

package() {
    mkdir -p "${pkgdir}/usr/lib/obs-plugins"
    cp "${srcdir}/droidcam-obs/bin/64bit/droidcam-obs.so" "${pkgdir}/usr/lib/obs-plugins/"
    mkdir -p "${pkgdir}/usr/share/obs/obs-plugins/droidcam-obs"
    cp -r "${srcdir}/droidcam-obs/data/locale" "${pkgdir}/usr/share/obs/obs-plugins/droidcam-obs/"
    cp -r "${srcdir}/ja-JP.ini" "${pkgdir}/usr/share/obs/obs-plugins/droidcam-obs/locale"
}

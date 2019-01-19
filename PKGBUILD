# Maintainer: NexAdn
pkgname=obs-linuxbrowser-bin
pkgver=0.6.0
_obsver=22.0.2
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
provides=("obs-linuxbrowser")
conflicts=("obs-linuxbrowser")
depends=(
	"obs-studio>=${_obsver}"
	"gconf" "nss" "libxss" "pango" "atk" "libxrandr" "libxcomposite"
)
optdepends=(
	"pepper-flash: Flash support"
	"cef-minimal: keep libraries up to date"
)
source=(
    "https://github.com/bazukas/obs-linuxbrowser/releases/download/${pkgver}/linuxbrowser${pkgver}-obs${_obsver}-64bit.tgz"
)
sha256sums=('0c0defa5dee8ad28f279bb8be318bdd7eca626e7ad74b1d61c1315c149d46478')
package() {
    cd ${srcdir}/obs-linuxbrowser
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-linuxbrowser/
    install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./data/* ${pkgdir}/usr/share/obs/obs-plugins/obs-linuxbrowser/
}

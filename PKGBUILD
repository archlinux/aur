# Maintainer: NexAdn
pkgname=obs-linuxbrowser-bin
pkgver=0.5.1
_obsver=21.1.2
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
sha256sums=('56c76525ed9c608536b4db67af7492a0ae2090fd005036103343d73bd1714ba5')
package() {
    cd ${srcdir}/obs-linuxbrowser
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-linuxbrowser/
    install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./data/* ${pkgdir}/usr/share/obs/obs-plugins/obs-linuxbrowser/
}

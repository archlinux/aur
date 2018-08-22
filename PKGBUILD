# Maintainer: NexAdn
pkgname=obs-linuxbrowser-bin
pkgver=0.5.2
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
sha256sums=('97dcc3bea09e8ebe5befd6888039aea06b705c24a0d397eb615cefbfe6af18ee')
package() {
    cd ${srcdir}/obs-linuxbrowser
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/obs-linuxbrowser/
    install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./data/* ${pkgdir}/usr/share/obs/obs-plugins/obs-linuxbrowser/
}

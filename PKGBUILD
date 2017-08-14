# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.3.0
_obsver=20.0.1
pkgrel=2
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=${_obsver}"
	"gconf" "nss" "libxss" "pango" "atk" "libxrandr" "libxcomposite"
)
optdepends=("pepper-flash: Flash support")
source=(
    "https://github.com/bazukas/${pkgname}/releases/download/${pkgver}/linuxbrowser${pkgver}-obs${_obsver}-64bit.tgz"
)
sha256sums=(
    "d455b4e36f8b4ec7c12ac255a0fc0bedf3572a5c74754a14f26150e5c95edff9"
)
package() {
    cd ${srcdir}/${pkgname}
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/${pkgname}/
    install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./data/* ${pkgdir}/usr/share/obs/obs-plugins/${pkgname}/
}

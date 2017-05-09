# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.2.0
pkgrel=1
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=18.0.1"
	"gconf" "nss" "libxss" "pango" "atk" "libxrandr" "libxcomposite"
)
optdepends=("pepper-flash: Flash support")
source=(
    "https://github.com/bazukas/${pkgname}/releases/download/${pkgver}/linuxbrowser${pkgver}-obs18.0.1-64bit.tgz"
)
sha256sums=(
    "45a2f2ded502b753c20aa4ac00bf9fcfdf91c6b1065231a67edd45c455bfb914"
)
package() {
    cd ${srcdir}/${pkgname}
    install -d ${pkgdir}/usr/lib/obs-plugins/
    install -d ${pkgdir}/usr/share/obs/obs-plugins/${pkgname}/
    install -Dm755 ./bin/64bit/* ${pkgdir}/usr/lib/obs-plugins/
    cp -R ./data/* ${pkgdir}/usr/share/obs/obs-plugins/${pkgname}/
}

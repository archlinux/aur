# Maintainers: (refer to the github page)
pkgname="raat-server"
pkgver=1.0.0
pkgrel=1
pkgdesc="Remote Archlinux Android Tool (server)"
arch=('any')
url="https://github.com/Student-Team-Projects/RAAT-Server"
license=('GPL')
depends=('cinnamon' 'tigervnc' 'openssh')
source=(
	"https://github.com/Student-Team-Projects/RAAT-Server/releases/download/v${pkgver}/raat-server-v${pkgver}.tar.gz"
	"https://github.com/Student-Team-Projects/RAAT/releases/download/v${pkgver}/raat-client-v${pkgver}.apk"
)
noextract=("raat-client-v${pkgver}.apk")
sha256sums=(
	"ded6bcbd0c03f851ed61c936e59447bdbfce3b763679465f661060cd1183e8cb"
	"94e6e654558984f92227927c6a48988bd37de0a0ebd767a1b3d06716ce38955f"
)

package() {
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/opt"
	cp "${srcdir}/script.sh" "${pkgdir}/usr/bin/raat-server"
	chmod +x "${pkgdir}/usr/bin/raat-server"
	cp "${srcdir}/raat-client-v1.0.0.apk" "${pkgdir}/usr/opt/raat-client.apk"
}


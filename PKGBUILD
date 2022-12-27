# Maintainer: moj <contact (cat) moritzj (dog) de>
# Contributor: Clansty <i@gao4.pw>
pkgname=postman-agent
pkgver=0.4.9
pkgrel=1
pkgdesc="The Postman agent overcomes the Cross Object Resource Sharing (CORS) limitations of browsers, and facilitates API request sending from your browser version of Postman. Using the system electron"
arch=('any')
options=(!strip)
url="https://www.postman.com/"
source=(
	"postman-agent-${pkgver}-linux-x64.tar.gz::https://dl-agent.pstmn.io/download/version/${pkgver}/linux64"
	"postman-agent.desktop"
)
depends=(electron)
sha256sums=('ba69cb5494e2fe00d40ffc86f04111f224be63625e2ed41e7f4afc6335726c74'
            '1a4b04c499d03296049104a06863eb2b9341d93e7fddaa8b22b0a89b2e1b0525')
package() {
	install -d "${pkgdir}/usr/share"
	cp -r "Postman Agent/app/resources/app" "${pkgdir}/usr/share"
	mv "${pkgdir}/usr/share/app" "${pkgdir}/usr/share/postman-agent"
    install -d "${pkgdir}/usr/share/postman-agent"
    install -Dm644 "postman-agent.desktop" "${pkgdir}/usr/share/applications/postman-agent.desktop"
    install -Dm644 "Postman Agent/app/icons/icon_128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/postman-agent.png"
} 

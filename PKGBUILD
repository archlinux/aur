# Maintainer: moj <contact (cat) moritzj (dog) de>
# Contributor: Clansty <i@gao4.pw>
pkgname=postman-agent
pkgver=0.4.89
pkgrel=1
pkgdesc="The Postman agent overcomes the Cross Object Resource Sharing (CORS) limitations of browsers, and facilitates API request sending from your browser version of Postman. Using the system electron"
arch=('x86_64')
options=(!strip)
url="https://www.postman.com/"
source=(
    "postman-agent-${pkgver}-linux-x64.tar.gz::https://dl-agent.pstmn.io/download/version/${pkgver}/linux64"
    "postman-agent.desktop"
)
depends=(electron)
sha256sums=('1b1d8bfcac14d56f9f80a0eefb6333adee9a316770693bb8512aa5620fef1d9f'
            '1a4b04c499d03296049104a06863eb2b9341d93e7fddaa8b22b0a89b2e1b0525')
package() {
    install -d "${pkgdir}/usr/share"
    cp -r "Postman Agent/app/resources/app" "${pkgdir}/usr/share"
    mv "${pkgdir}/usr/share/app" "${pkgdir}/usr/share/postman-agent"
    install -d "${pkgdir}/usr/share/postman-agent"
    install -Dm644 "postman-agent.desktop" "${pkgdir}/usr/share/applications/postman-agent.desktop"
    install -Dm644 "Postman Agent/app/resources/app/assets/images/postmanlogo-head-blue-prod-linux@4x.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/postman-agent.png"
}

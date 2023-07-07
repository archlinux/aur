# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="chrolog-bin"
pkgver=1.5.0
pkgrel=2
pkgdesc="A automated time tracking tool"
arch=("x86_64")
url="https://github.com/Lukylix/Chrolog"
license=('custom')
depends=('hicolor-icon-theme' 'electron' 'python' 'libinput' 'perl' 'bash' 'zlib' 'glibc' 'expat' 'systemd-libs' 'gcc-libs')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux.zip"
    "${pkgname%-bin}.sh")
sha256sums=('4ba773a11f93fe66357605f403517e0326aa67201cd25a7fbe1a0919236e21f6'
            '6ca17df0f40a8e44acdddbd48727be5eae862f86ba169806afeff10686c52c6e')
     
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/linux-unpacked/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/linux-unpacked/resources/resources/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Chrolog" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
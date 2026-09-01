# Maintainer: sinbud2004 <sinbud2004@users.noreply.github.com>
pkgname=private_ding_zhejiang
pkgver=2.7.4.1
pkgrel=1
pkgdesc="浙政钉 (Zhejiang Government DingTalk) - AppImage build for ArchLinux"
arch=('x86_64')
url="https://github.com/Paul-sinbud2004/private_ding_zhejiang"
license=('unknown')
depends=('fuse2')
options=('!strip' '!emptydirs')
noextract=("${pkgname}-${pkgver}-x86_64.AppImage")
source=("${pkgname}.desktop" "logo.png")
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/com.zjd.gov-${pkgver}-x86_64.AppImage")
sha256sums=('7644aa9276eb139a80802a18d02a5305b741088485b04023d38c3ec49e2dc09a'
            '446c94ccb30cf016f77f8bbf63619a608be4c7bf7faaa9d633a4d622e2e149ab')
sha256sums_x86_64=('040adb95111e9233a06ed1e9a8ce8104247e12c754c546857c5553703a893f91')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}-x86_64.AppImage"
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.AppImage"
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}

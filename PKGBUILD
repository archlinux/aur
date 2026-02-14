# Maintainer: Ahmed <ahmedalwanmunshed@gmail.com>
pkgname=zerone-ai-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="ZERONE AI Desktop Application - Intelligent Chat Interface"
arch=('x86_64')
url="https://github.com/b2-3c/ZERONE-AI"
license=('ISC')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'fuse2')
options=(!strip)

# الرابط المعدل ليتناسب مع تسمية GitHub الدقيقة
source=("https://github.com/b2-3c/ZERONE-AI/releases/download/v${pkgver}/ZERONE-AI-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    # تثبيت ملف الـ AppImage
    install -Dm755 "${srcdir}/ZERONE-AI-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # إنشاء رابط تشغيل سريع في النظام
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/zerone-ai"
}

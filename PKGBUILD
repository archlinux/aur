# Maintainer: Ahmed <ahmedalwanmunshed@gmail.com>
pkgname=zerone-ai-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="ZERONE AI Desktop Application"
arch=('x86_64') # تصحيح الاسم هنا
url="https://github.com/b2-3c/ZERONE-AI"
license=('ISC')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'fuse2')
options=(!strip) # ضروري لملفات AppImage

# تأكد من الرابط التالي (طابق حالة الأحرف تماماً كما في GitHub)
source=("https://github.com/b2-3c/ZERONE-AI/releases/download/v${pkgver}/ZERONE-AI-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    # إنشاء المجلد ووضع الملف بداخله
    install -Dm755 "${srcdir}/ZERONE-AI-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # عمل الاختصار في /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/zerone-ai"
}

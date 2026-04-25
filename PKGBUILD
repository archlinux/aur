# Maintainer: Ahmet Çağrı AKGÜN <eposta@adresin.com>
pkgname=mybox-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Metodbox için minimalist masaüstü istemcisi"
arch=('x86_64')
url="https://github.com/Usta-Cagri/mybox"
license=('MIT')
depends=('electron' 'nss' 'gtk3' 'alsa-lib' 'libxss')
# GitHub'a yüklediğin dosyanın tam adını source kısmına yazıyoruz
source=("${pkgname}-${pkgver}.zip::https://github.com/Usta-Cagri/mybox/releases/download/v${pkgver}/portal-0.1.0.zip")
sha256sums=('9b7707aac5b8414637970af284eff90a44a57dd9ac19e0629cf8d3d418cf4152')

package() {
    # Kurulum dizinini oluştur
    install -dm755 "${pkgdir}/opt/${pkgname}"
    
    # Zip içinden çıkan dosyaları kopyala
    # linux-unpacked içindeki dosyalar direkt srcdir içine çıkmış olabilir, kontrol et
    cp -r "${srcdir}/." "${pkgdir}/opt/${pkgname}/"

    # /usr/bin altına kısayol ekle
    install -dm755 "${pkgdir}/usr/bin"
    # 'portal' ismiyle çalıştırmak için link oluşturuyoruz
    ln -s "/opt/${pkgname}/portal" "${pkgdir}/usr/bin/mybox"
}

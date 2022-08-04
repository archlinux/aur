# Maintainer:Integral<luckys68@126.com>
# Maintainer:ston<2424284164@qq.com>
pkgname=deepin-wine-formatfactory
pkgver=4.9.5
pkgrel=3
pkgdesc="Format Factory（格式工厂）on Deepin Wine"
arch=('x86_64')
url="http://www.pcfreetime.com/formatfactory/CN/index.html"
license=('custom')
depends=('lib32-libxext' 'xdg-utils' 'gtk2')
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.pcfreetime.formatfactory.deepin/com.pcfreetime.formatfactory.deepin_${pkgver}deepin${pkgrel}_i386.deb"
)
sha512sums=('66cf08877557faa876e3b38af309182f5de4d0f9ddebbc7919ad926dca9cd35aad326428b9faec8f6f46daa80a697c8eb54ab8dabc16af3cf4ed6f2a92b19ffd')

package() {
    echo "  -> Extracting the data.tar.xz..."
    bsdtar -xvf data.tar.xz -C "${pkgdir}/"
    chmod -R 755 "${pkgdir}/opt"

    echo "  -> Installing..."
    # Launcher
    install -Dm755 "${pkgdir}/opt/apps/com.pcfreetime.formatfactory.deepin/files/run.sh" "${pkgdir}/usr/bin/${pkgname}"
    # Desktop Entry 
    install -Dm644 "${pkgdir}/opt/apps/com.pcfreetime.formatfactory.deepin/entries/applications/com.pcfreetime.formatfactory.deepin.desktop" -t "${pkgdir}/usr/share/applications/"
    # Icons
    cp -r "${pkgdir}/opt/apps/com.pcfreetime.formatfactory.deepin/entries/icons/" "${pkgdir}/usr/share/"
    chmod -R 755 "${pkgdir}/usr/share/icons"
}

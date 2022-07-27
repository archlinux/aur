# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer:Integral<luckys68@126.com>
# Maintainer:ston<2424284164@qq.com>
pkgname=yuntucad-uos
pkgver=0.0.2.1
pkgrel=1
pkgdesc="云图三维 A collaboative CAD software."
arch=('x86_64')
url="https://www.yuntucad.com/"
license=('custom')
depends=('alsa-lib' 'gtk3' 'nss')
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/com.yuntucad.cloudcad/com.yuntucad.cloudcad_${pkgver}_amd64.deb"
)
sha512sums=('bc4158d4a25e484a1e4614f543de581aa8af5ecd19e56a6ef4961b5c6ba3c5ab3b1628a6fa9812222e4dfbb2823888b72e22424fc406e3bfa6ab0ed1cee5745c')

package() {
    echo "  -> Extracting the data.tar.xz..."
    bsdtar -xvf data.tar.xz -C "${pkgdir}/"
    chmod -R 755 "${pkgdir}/opt"

    echo "  -> Installing..."
    # Launcher
    install -Dm755 "${pkgdir}/opt/apps/com.yuntucad.cloudcad/files/yuntucad.sh" "${pkgdir}/usr/bin/${pkgname}"
    # Desktop Entry 
    install -Dm644 "${pkgdir}/opt/apps/com.yuntucad.cloudcad/entries/applications/com.yuntucad.cloudcad.desktop" -t "${pkgdir}/usr/share/applications/"
    # License
    install -Dm644 "${pkgdir}/opt/apps/com.yuntucad.cloudcad/files/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/apps/com.yuntucad.cloudcad/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# Maintainer: Integral <integral@member.fsf.org>
# Maintainer: ston <2424284164@qq.com>

pkgname=pixso-uos
pkgver=1.28.0
pkgrel=1
pkgdesc="A collaborative UI/UX design software."
arch=('x86_64')
url="https://pixso.cn/"
license=('custom')
depends=('alsa-lib' 'gtk3' 'nss')
optdepends=('libappindicator-gtk3: Allow Pixso to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
source=(
    "https://home-store-packages.uniontech.com/appstore/pool/appstore/c/cn.bosyun.pixso/cn.bosyun.pixso_${pkgver}_amd64.deb"
)
sha512sums=('10b251be950dcd11e9f85dc3aefa49b5ab6fcf4b59aa795785d714184b0fab6d19a33ee50cf23dddc27fbb5ad89f9de8050fad48491b23e2973d0e8e59d6b35e')

package() {
    echo "  -> Extracting the data.tar.xz..."
    bsdtar -xvf data.tar.xz -C "${pkgdir}/"
    chmod -R 755 "${pkgdir}/opt"

    echo "  -> Installing..."
    # Launcher
    install -Dm755 "${pkgdir}/opt/apps/cn.bosyun.pixso/files/pixso.sh" "${pkgdir}/usr/bin/${pkgname}"
    # Desktop Entry 
    install -Dm644 "${pkgdir}/opt/apps/cn.bosyun.pixso/entries/applications/cn.bosyun.pixso.desktop" -t "${pkgdir}/usr/share/applications/"
    # License
    install -Dm644 "${pkgdir}/opt/apps/cn.bosyun.pixso/files/LICENSE.electron.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "${pkgdir}/opt/apps/cn.bosyun.pixso/files/LICENSES.chromium.html" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

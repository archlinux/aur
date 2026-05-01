# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=apk-installer-gui
pkgver=1.0.0
pkgrel=1
pkgdesc="简单的图形 APK 安装器，支持右键APK直接安装"
arch=('any')
url="https://github.com/maoyaotang12/apk-installer"
license=('MIT')
depends=('android-tools' 'python' 'python-pyqt6')
conflicts=(${pkgname%-gui})
source=(git+$url.git)
sha256sums=('SKIP')

package() {
    # 安装主程序到 /usr/bin
    install -Dm755 "${srcdir}/${pkgname%-gui}/kde_apk_installer.py" "${pkgdir}/usr/bin/apk-installer"

    # 安装桌面文件 关联APK右键
    install -Dm644 "${srcdir}/${pkgname%-gui}/apk-installer.desktop" \
        "${pkgdir}/usr/share/applications/apk-installer.desktop"
    install -Dm644  ${srcdir}/${pkgname%-gui}/android.svg ${pkgdir}/usr/share/pixmaps/apk-installer.svg
    install -Dm644 "${srcdir}/${pkgname%-gui}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-gui}"
}

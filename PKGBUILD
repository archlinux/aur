# Maintainer: Sadid <sadid.shadow@gmail.com>
pkgname="pomodoro-logger"
pkgver="0.5.3"
pkgrel=1
pkgdesc="A Pomodoro Timer/Logger with Integrated Kanban Board"
arch=('x86_64')
url="https://github.com/zxch3n/PomodoroLogger"
license=('GPL3')
depends=('libxss' 'gtk3' 'nss')
source=("https://github.com/zxch3n/PomodoroLogger/releases/download/v${pkgver}/pomodoro-logger_${pkgver}_amd64.deb")
sha256sums=('214a81eb857af9a810f7ee18a23c983513d428d39f899a7fa9d932b9df00615d')
package() {
	tar -xf data.tar.xz -C "$pkgdir"
        mkdir -p "${pkgdir}/usr/bin/"
        ln -s '/opt/Pomodoro Logger/pomodoro-logger' "${pkgdir}/usr/bin/${pkgname}"
}
post_intall() {
        chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}

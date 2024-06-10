# Maintainer: Sadid <sadid.shadow@gmail.com>
pkgname="pomodoro-logger"
pkgver="0.6.3"
pkgrel=2
pkgdesc="A Pomodoro Timer/Logger with Integrated Kanban Board"
arch=('x86_64')
url="https://github.com/zxch3n/PomodoroLogger"
license=('GPL3')
depends=('libxss' 'gtk3' 'nss')
optdepends=('libappindicator-gtk3: For tray icon support')
source=("https://github.com/zxch3n/PomodoroLogger/releases/download/v${pkgver}/pomodoro-logger_${pkgver}_amd64.deb")
sha256sums=('d9cde7bde3286e4f05cc2e0bb9724b3eec9a5a33f8df362c779d169e7aaaa1dc')
package() {
	tar -xf data.tar.xz -C "$pkgdir"
        mkdir -p "${pkgdir}/usr/bin/"
        ln -s '/opt/Pomodoro Logger/pomodoro-logger' "${pkgdir}/usr/bin/${pkgname}"
}
post_intall() {
        chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}

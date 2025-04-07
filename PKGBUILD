# Maintainer: Canmi21 <9997200@qq.com>
# Contributor: Canmi(Canmi21)

# 由于 -bin 已经被占用，并且改版本提供的无法使用，已知问题：
# 1. 任务栏无法退出(JLC 官方问题)
# 2. 导航栏无法显示
# 3. 现在已经无法启动了 2025-04-07

# 故使用 jlc-assistant 作为包名，实际上是预编译的版本

pkgname=jlc-assistant
pkgver=5.0.69
pkgrel=1
pkgdesc="jlc-assistant, PCB order, 嘉立创下单小助手，修正预编译版本"
arch=('x86_64')
url="https://download.jlc.com/pcAssit/"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'electron' 'libappindicator-gtk3' 'libnotify')
conflicts=('jlc-assistant-bin')
source=("https://download.jlc.com/pcAssit/${pkgver}/JLCPcAssit-linux-x64-${pkgver}.zip")
sha256sums=('SKIP')

package() {
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/opt/jlc-assistant"
  cp "${srcdir}/jlc-assistant-linux-x64-${pkgver}/jlc-assistant/jlc-assistant.dkt" "${pkgdir}/usr/share/applications/jlc-assistant.desktop"
  cp -rf "${srcdir}/jlc-assistant-linux-x64-${pkgver}/jlc-assistant" "${pkgdir}/opt/jlc-assistant"
  chmod -R 777 "${pkgdir}/opt/jlc-assistant"
}

# To build and install the package, run:
# makepkg -si
# Maintainer: itsflame <post0877@gmail.com>
pkgname=shararam-linux-bin
pkgver=2.0.6
pkgrel=1
pkgdesc="Оригинальный Шарарам, портированный под Linux на основе Electron и Clean Flash"
arch=('x86_64')
url="https://github.com/itsflameee/shararam-linux"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'mesa' 'bash')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/itsflameee/shararam-linux/archive/refs/heads/main.tar.gz"
  "electron-bin::https://github.com/itsflameee/shararam-linux/releases/download/v2.0.6/electron"
)
sha256sums=(
  'SKIP'
  '7b1d423e48c77e5b5c79d138eba372e97d5c94159d9a27f3909f785d10ed289a'
)

package() {
  cd "${srcdir}/shararam-linux-main"

  install -d "${pkgdir}/opt/shararam-linux"

  cp -r ./* "${pkgdir}/opt/shararam-linux/"

  install -Dm755 "${srcdir}/electron-bin" "${pkgdir}/opt/shararam-linux/electron"
  chmod +x "${pkgdir}/opt/shararam-linux/shararam"

  install -Dm644 "shararam.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/shararam.png"
  install -Dm644 "shararam.desktop" "${pkgdir}/usr/share/applications/shararam.desktop"
}

# Maintainer: Vniverse77 <vniverse77@gmail.com>
pkgname=start-messenger-bin
pkgver=1.3.1
pkgrel=2
pkgdesc="Start Messenger Desktop - Arch Linux Version"
arch=('x86_64')
url="https://github.com/Vniverse77/start-messenger-arch"
license=('GPL-3.0-or-later')
depends=('libutil-linux' 'nss' 'nspr' 'alsa-lib' 'atk' 'cups' 'gtk3' 'libxss' 'libxtst')
options=('!strip')

source=("https://github.com/Vniverse77/start-messenger-arch/releases/download/${pkgver}/start_messenger_arch.tar.zst")
sha256sums=('e72c7205da9f43aa7ffaf8ea9cb861a22fcd72508aacfdbe452c548422680f09')

package() {
  cp -r "${srcdir}/usr" "${pkgdir}/"

  # İsmi start-messenger.desktop olarak düzeltelim
  mv "${pkgdir}/usr/share/applications/start_deb.desktop" "${pkgdir}/usr/share/applications/start-messenger.desktop"

  # Desktop dosyasının içindeki Exec komutunu kontrol edip düzeltelim
  sed -i 's/Exec=.*/Exec=Start/' "${pkgdir}/usr/share/applications/start-messenger.desktop"
  sed -i 's/Name=.*/Name=Start Messenger/' "${pkgdir}/usr/share/applications/start-messenger.desktop"
  sed -i 's/Icon=.*/Icon=start/' "${pkgdir}/usr/share/applications/start-messenger.desktop"
}

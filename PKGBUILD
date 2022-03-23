# Maintainer: Nyaacinth <nyaacinth_liota@outlook.com>
pkgname=openutau-bin
pkgver=0.0.653
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=("x86_64")
url="https://github.com/stakira/OpenUtau"
license=("MIT")
depends=()
provides=("openutau")
conflicts=()
source=("https://github.com/stakira/OpenUtau/releases/download/OpenUtau-Latest/OpenUtau-linux-x64.tar.gz"
        "openutau.sh"
        "openutau.png"
        "openutau.desktop")
sha256sums=("c3c15d6984d01598bde968f48a668a5b3005cc03988406685633b4f79f2191d9"
            "143ec817eb8a88ea11a690f54cd4a0178e590b802ed518ea3b5bd6b52ffd0ca6"
            "205c63ec5cb003b537f705a9707664feb047802d1bb02b84bbf52db2b196796d"
            "fb3ac0c32bf7ea057fbb4655c3aaefcee45302026d8dfff401eac86948fed950")

package() {
  install -d "${pkgdir}/opt/openutau"
  bsdtar -xf "${srcdir}/OpenUtau-linux-x64.tar.gz" --directory "${pkgdir}/opt/openutau"
  install -Dm644 "${srcdir}/openutau.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openutau.png"
  install -Dm755 "${srcdir}/openutau.sh" "${pkgdir}/usr/bin/openutau"
  install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
}

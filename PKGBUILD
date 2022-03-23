# Maintainer: Nyaacinth <nyaacinth_liota@outlook.com>
pkgname=openutau-bin
pkgver=0.0.656
pkgrel=2
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
sha256sums=("d0c29a1e604bf9522e5268984ac6512ec7f8b40ed7b7525813b479d59687f7a7"
            "b7e1f13f15367a039f915b290db43d6cbb33903836cd8d73cc16d036fde3342a"
            "205c63ec5cb003b537f705a9707664feb047802d1bb02b84bbf52db2b196796d"
            "fb3ac0c32bf7ea057fbb4655c3aaefcee45302026d8dfff401eac86948fed950")

package() {
  install -d "${pkgdir}/opt/openutau"
  bsdtar -xf "${srcdir}/OpenUtau-linux-x64.tar.gz" --directory "${pkgdir}/opt/openutau"
  install -Dm644 "${srcdir}/openutau.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/openutau.png"
  install -Dm755 "${srcdir}/openutau.sh" "${pkgdir}/usr/bin/openutau"
  install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
}

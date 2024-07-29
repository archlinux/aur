# Maintainer: Jenrikku (JkKU)
pkgname=openutau-bin
pkgver=0.1.529
pkgrel=1
pkgdesc="Open source UTAU successor"
arch=("x86_64")
url="https://github.com/stakira/OpenUtau"
license=("MIT")
depends=()
provides=("openutau")
conflicts=()
source=("https://github.com/stakira/OpenUtau/releases/download/build%2F$pkgver/OpenUtau-linux-x64.tar.gz"
        "openutau.sh"
        "openutau.svg"
        "openutau.desktop")
noextract=("${source[0]}")
sha256sums=('b40bd3dcb86522ef3f33dfe3cd3b77927db7be4fd80fd5685b6997270db073f8'
            'b7e1f13f15367a039f915b290db43d6cbb33903836cd8d73cc16d036fde3342a'
            '490fd7489bb3c4225c3f2d1e96ba8320bd481da6eb031b97229dcf06997c2f5b'
            'fb3ac0c32bf7ea057fbb4655c3aaefcee45302026d8dfff401eac86948fed950')

package() {
  install -d "${pkgdir}/opt/openutau"
  bsdtar -xf "${srcdir}/OpenUtau-linux-x64.tar.gz" --directory "${pkgdir}/opt/openutau"
  install -Dm644 "${srcdir}/openutau.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/openutau.svg"
  install -Dm755 "${srcdir}/openutau.sh" "${pkgdir}/usr/bin/openutau"
  install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
}

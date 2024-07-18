# Maintainer: Holden Grayer <grayer0113@outlook.com>
pkgname=openutau-beta
pkgver=0.1.501
pkgrel=1
pkgdesc="Open source UTAU successor (Beta)"
arch=("x86_64")
url="https://github.com/stakira/OpenUtau"
license=("MIT")
depends=()
provides=("openutau")
conflicts=()
source=("https://github.com/stakira/OpenUtau/releases/download/build%2F${pkgver}/OpenUtau-linux-x64.tar.gz"
        "openutau.sh"
        "openutau.png"
        "openutau.desktop")
sha256sums=("fba0843086d18cfc3be0686701d8d011bb7c51c1cda8aadfb7de79056253e1e4"
            "d30d80ab1917041001d265b00829b407bd72cb7d99ed64e5a25901cdc27acce4"
            "4f29a46c248e04bd383b897c8a9eec2614c00e773aab75a6e259f7ee0411c234"
            "5433ced76dee63746bee7f830429310e8e98b9193ca95ce66ad8b3bfdbb3c133")

package() {
  install -d "${pkgdir}/opt/openutau"
  bsdtar -xf "${srcdir}/OpenUtau-linux-x64.tar.gz" --directory "${pkgdir}/opt/openutau"
  install -Dm644 "${srcdir}/openutau.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/openutau.png"
  install -Dm755 "${srcdir}/openutau.sh" "${pkgdir}/usr/bin/openutau"
  install -Dm755 "${srcdir}/openutau.desktop" "${pkgdir}/usr/share/applications/openutau.desktop"
}

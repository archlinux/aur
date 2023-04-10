# Maintainer: Kingkor Roy Tirtho <krtirho@gmail.com>
pkgname=spotube-bin
pkgver=2.7.1
pkgrel=1
epoch=
pkgdesc="Open source Spotify client that doesn't require Premium nor uses Electron! Available for both desktop & mobile!"
arch=(x86_64)
url="https://github.com/KRTirtho/spotube/"
license=('BSD-4-Clause')
groups=()
depends=('gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/KRTirtho/spotube/releases/download/v${pkgver}/spotube-linux-${pkgver}-x86_64.tar.xz")
noextract=()
md5sums=(83a8cd464d61f47af363c891129f429d)
validpgpkeys=()

package() {
  install -dm755 "${pkgdir}/usr/share/icons/spotube"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/appdata"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  mv ./spotube.desktop "${pkgdir}/usr/share/applications"
  mv ./spotube-logo.png "${pkgdir}/usr/share/icons/spotube/"
  mv ./com.github.KRTirtho.Spotube.appdata.xml "${pkgdir}/usr/share/appdata/spotube.appdata.xml"
  cp -ra ./data ./lib ./spotube "${pkgdir}/usr/share/${pkgname}"
  sed -i 's|com.github.KRTirtho.Spotube|spotube|' "${pkgdir}/usr/share/appdata/spotube.appdata.xml"
  ln -s "/usr/share/${pkgname}/spotube" "${pkgdir}/usr/bin/spotube"
}

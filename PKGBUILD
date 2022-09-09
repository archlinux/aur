# Maintainer: Kingkor Roy Tirtho <krtirho@gmail.com>
pkgname=spotube-bin
pkgver=2.4.0
pkgrel=1
epoch=
pkgdesc="A lightweight free Spotify crossplatform-client which handles playback manually, streams music using Youtube & no Spotify premium account is needed"
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
source=("https://github.com/KRTirtho/spotube/releases/download/v${pkgver}/Spotube-linux-x86_64.tar.xz")
noextract=()
md5sums=(a7b32692d2cc4df99d3bc3d14f524a40)
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

# Maintainer: Marco Calautti <phoenix_87_c@hotmail.com>
pkgname=spotube-fork-bin
pkgver=5.1.1
pkgrel=2
epoch=
pkgdesc="Fork by marcos10pcs of Spotube, open source Music client that doesn't require Premium nor uses Electron! Available for both desktop & mobile!"
arch=(x86_64)
url="https://github.com/marcos10pcs/spotube"
license=('BSD-4-Clause')
groups=()
depends=('mpv' 'libappindicator-gtk3' 'libsecret' 'jsoncpp' 'libnotify' 'xdg-user-dirs' 'webkit2gtk-4.1' 'yt-dlp-nightly-bin')
makedepends=()
checkdepends=()
optdepends=()
provides=("spotube")
conflicts=("spotube-bin" "spotube")
replaces=("spotube-bin")
backup=()
options=()
install=
changelog=
source=("https://github.com/marcos10pcs/spotube/releases/download/v${pkgver}/spotube-linux-${pkgver}-x86_64.tar.xz")
noextract=()
md5sums=('e812f86cc60be4021f9abfc676bde650')
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

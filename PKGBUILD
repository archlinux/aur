# Maintainer: Benjamin Kampmann <ben@acter.global>
pkgname=acter-nightly-bin
pkgver=1.25.110020
pkgrel=1
epoch=
pkgdesc="Casual Community Organizing"
arch=(x86_64)
url="https://acter.global"
license=('custom:Acter Public Source License 1.0')
groups=()
depends=('mpv' 'libsecret' 'jsoncpp' 'xdg-user-dirs' 'libayatana-appindicator')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=('acter-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/acterglobal/a3/releases/download/v1.25.110020/acter-linux-x64-1.25.110020.tar.bz2")
noextract=()
md5sums=("a059e9e9e5fa811e9d9e277ff2a624c3")
validpgpkeys=()

package() {
  install -dm755 "${pkgdir}/share/icons/hicolor/48x48/apps"
  install -dm755 "${pkgdir}//share/icons/hicolor/scalable/apps"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/appdata"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"

  mv ./global.acter.a3.desktop "${pkgdir}/usr/share/applications"
  mv ./acter.png "${pkgdir}/share/icons/hicolor/48x48/apps/"
  mv ./acter.svg "${pkgdir}//share/icons/hicolor/scalable/apps"
  mv ./LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/"
  # mv ./global.acter.a3.appdata.xml "${pkgdir}/usr/share/appdata/acter.appdata.xml"
  cp -ra ./data ./lib ./acter "${pkgdir}/usr/share/${pkgname}"
  # sed -i 's|global.acter.a3|acter|' "${pkgdir}/usr/share/appdata/acter.appdata.xml"
  ln -s "/usr/share/${pkgname}/acter" "${pkgdir}/usr/bin/acter"
}
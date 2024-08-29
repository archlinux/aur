# Maintainer: Benjamin Kampmann <ben@acter.global>
pkgname=acter-bin
pkgver=1.24.8292
pkgrel=2
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
conflicts=('acter-nightly-bin')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/acterglobal/a3/releases/download/v${pkgver}/acter-linux-x64-${pkgver}.tar.bz2")
noextract=()
md5sums=("4c8d4b6ff96f2687a86a7df59d8d2c3d")
validpgpkeys=()

package() {
  install -dm755 "${pkgdir}/usr/share/icons/acter"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/appdata"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"

  mv ./global.acter.a3.desktop "${pkgdir}/usr/share/applications"
  mv ./acter-logo.png "${pkgdir}/usr/share/icons/acter/"
  mv ./LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/"
  # mv ./global.acter.a3.appdata.xml "${pkgdir}/usr/share/appdata/acter.appdata.xml"
  cp -ra ./data ./lib ./acter "${pkgdir}/usr/share/${pkgname}"
  # sed -i 's|global.acter.a3|acter|' "${pkgdir}/usr/share/appdata/acter.appdata.xml"
  ln -s "/usr/share/${pkgname}/acter" "${pkgdir}/usr/bin/acter"
}
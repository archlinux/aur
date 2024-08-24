# Maintainer: Benjamin Kampmann <ben@acter.global>
pkgname=acter-nightly-bin
pkgver=1.24.8240
pkgrel=1
epoch=
pkgdesc="Casual Community Organizing"
arch=(x86_64)
url="https://acter.global"
license=('custom:Acter Public Source License 1.0')
groups=()
depends=('mpv' 'libsecret' 'jsoncpp' 'xdg-user-dirs' 'libayatana-appindicator3-1')
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
source=("https://github.com/acterglobal/a3/releases/download/nightly-2024-08-24/acter-nightly-linux-x64-1.24.8240.tar.bz2")
noextract=()
md5sums=("0fbe40fcf324b7f8ca546451842e7a72")
validpgpkeys=()

package() {
  install -dm755 "${pkgdir}/usr/share/icons/acter"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/appdata"
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"

  mv ./global.acter.a3.desktop "${pkgdir}/usr/share/applications"
  mv ./logo.png "${pkgdir}/usr/share/icons/acter/"
  mv ./LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/"
  # mv ./global.acter.a3.appdata.xml "${pkgdir}/usr/share/appdata/acter.appdata.xml"
  cp -ra ./data ./lib ./acter "${pkgdir}/usr/share/${pkgname}"
  # sed -i 's|global.acter.a3|acter|' "${pkgdir}/usr/share/appdata/acter.appdata.xml"
  ln -s "/usr/share/${pkgname}/acter" "${pkgdir}/usr/bin/acter"
}
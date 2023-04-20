# Maintainer: Sam Bilbow <samuel.bilbow@icloud.com>
pkgname=ultraleap-hand-tracking-control-panel
pkgver=3.1.0
pkgrel=1
epoch=
pkgdesc="A visualisation and settings management tool for the Ultraleap Tracking Service."
arch=('x86_64')
url=""
license=('PROPRIETARY')
groups=()
depends=(ultraleap-hand-tracking-service)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='ultraleap-hand-tracking-control-panel.install'
changelog=
source=("https://repo.ultraleap.com/apt/pool/main/u/${pkgname}/${pkgname}_684937.deb")
noextract=()
md5sums=('a7706c1dff7b335c5a35bfbfc5cb90bb')
validpgpkeys=()

prepare() {
    tar xJf "data.tar.xz"
}

package() {
  # Install files in opt directory
  install -Dm755 "${srcdir}/opt/ultraleap-hand-tracking-control-panel/ultraleap-hand-tracking-control-panel" \
    "${pkgdir}/opt/ultraleap-hand-tracking-control-panel/ultraleap-hand-tracking-control-panel"
  install -Dm755 "${srcdir}/opt/ultraleap-hand-tracking-control-panel/UnityPlayer.so" \
    "${pkgdir}/opt/ultraleap-hand-tracking-control-panel/UnityPlayer.so"
  cp -r "${srcdir}/opt/ultraleap-hand-tracking-control-panel/ultraleap-hand-tracking-control-panel_Data/" "${pkgdir}/opt/ultraleap-hand-tracking-control-panel/"


  # Install files in usr directory
  install -Dm755 "${srcdir}/usr/bin/ultraleap-hand-tracking-control-panel" \
    "${pkgdir}/usr/bin/ultraleap-hand-tracking-control-panel"
  install -Dm644 "${srcdir}/usr/share/applications/ultraleap-hand-tracking-control-panel.desktop" \
    "${pkgdir}/usr/share/applications/ultraleap-hand-tracking-control-panel.desktop"
  install -Dm644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/copyright" \
    "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/copyright"
  install -Dm644 "${srcdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/changelog.gz" \
    "${pkgdir}/usr/share/doc/ultraleap-hand-tracking-control-panel/changelog.gz"
  install -Dm644 "${srcdir}/usr/share/lintian/overrides/ultraleap-hand-tracking-control-panel" \
    "${pkgdir}/usr/share/lintian/overrides/ultraleap-hand-tracking-control-panel"
  cp -r  "${srcdir}/usr/share/gnome-shell/" \
    "${pkgdir}/usr/share/gnome-shell/"
}

# Maintainer: Leone <comdir@infonix.info>
pkgname=yd-go
pkgver=5af17d8
pkgrel=7
epoch=
pkgdesc="Panel indicator for Yandex-disk CLI daemon (linux)"
arch=('x86_64')
url="https://github.com/slytomcat/yd-go"
license=('GPL-3.0 license')
groups=()
depends=("go" "yandex-disk" "dbus-broker" "gendesk")
makedepends=()
checkdepends=()
optdepends=()
provides=()
#conflicts=()
#replaces=()
#backup=()
options=('!strip' '!debug')
install=
changelog=
source=("https://github.com/slytomcat/yd-go/releases/download/master-5af17d8/yd-go"
yd-go.png)

#noextract=()
md5sums=('SKIP'
         'SKIP')

validpgpkeys=()

prepare() {
	
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories="GTK;GNOME;X-GNOME-NetworkSettings;Network;" \
    --icon "/usr/share/pixmaps/${pkgname}.png" \
    --exec "yd-go"
	
}

package() {
 # mv "litemanager.png" "${srcdir}/litemanager.png"
 # install -d "${srcdir}/" "${pkgdir}/opt/${pkgname}/"
  #cp  "${srcdir}/yd-go" "${pkgdir}/yd-go.bin"
  install -Dm755 "${srcdir}/yd-go" "${pkgdir}/opt/yd-go/yd-go"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/yd-go/yd-go" "${pkgdir}/usr/bin/yd-go"
  install -Dm644 "${srcdir}/yd-go.desktop" "${pkgdir}/usr/share/applications/yd-go.desktop"
  install -Dm644 "${srcdir}/yd-go.png" "${pkgdir}/usr/share/pixmaps/yd-go.png"
}

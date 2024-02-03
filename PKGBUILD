# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Leone <comdir@infonix.info>
pkgname=yd-go
pkgver=5af17d8
pkgrel=1
epoch=
pkgdesc="Panel indicator for Yandex-disk CLI daemon (linux)"
arch=('x86_64')
url="https://github.com/slytomcat/yd-go"
license=('GPL-3.0 license')
groups=()
depends=()
makedepends=('go')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
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
  install -d "${pkgdir}/" "$pkgdir/opt/${pkgname}"
  install -Dm755 "${srcdir}/yd-go" "$pkgdir/opt/yd-go/yd-go"
  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/yd-go/yd-go" "$pkgdir/usr/bin/yd-go"
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

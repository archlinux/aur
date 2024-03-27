# Maintainer: Leone <comdir@infonix.info>
pkgname=yd-go
pkgver=5af17d8
pkgrel=8
epoch=
pkgdesc="Panel indicator for Yandex-disk CLI daemon (linux)"
arch=('x86_64')
url="https://github.com/slytomcat/yd-go"
license=('GPL-3.0-only')
groups=()
depends=("yandex-disk")
makedepends=("gendesk")
checkdepends=()
optdepends=()
provides=()
conflicts=("yd-go-git")
#replaces=()
#backup=()
options=('!strip' '!debug')
install=
changelog=
source=("https://github.com/slytomcat/yd-go/releases/download/master-5af17d8/yd-go"
yd-go.png)

#noextract=()
b2sums=('fe74594fa1b1a564bce469bc13aa0e65b47bcfef4de4b07f11dabaf92594eab4e8408e7dd777edfb869f84a24821be3d3bfa4e8437559a8821551a7091870756'
        '647865327ba584fdc36ddc37e85b6457af6ca888d1b25479a7b8a94a81d0629a71c954a21c8604ef5e96c529178fcf9c4b6fd82df41a1ab6a9ab2d5c281c2c41')


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
  install -Dm755 "${srcdir}/yd-go" "${pkgdir}/opt/yd-go/yd-go"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/opt/yd-go/yd-go" "${pkgdir}/usr/bin/yd-go"
  install -Dm644 "${srcdir}/yd-go.desktop" "${pkgdir}/usr/share/applications/yd-go.desktop"
  install -Dm644 "${srcdir}/yd-go.png" "${pkgdir}/usr/share/pixmaps/yd-go.png"
}


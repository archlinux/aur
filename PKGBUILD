# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=modrinth-app-bin
pkgver=0.15.20
pkgrel=1
pkgdesc="Minecraft mod manager and launcher from Modrinth (upstream binary)"
arch=('x86_64')
url="https://modrinth.com/app"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('modrinth-app')
conflicts=('modrinth-app')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/modrinth/code/releases/download/v${pkgver}/Modrinth.App_${pkgver}_amd64.deb")
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('b88f8f4b5b2017ad99fb3e89cbfe1dc1a6693aa67c2edf7e94ee959a42fb533a')

package() {
  bsdtar -xOf "$srcdir/${pkgname}-${pkgver}.deb" 'data.tar.*' \
    | bsdtar -xpf - -C "$pkgdir" usr
  ln -s ModrinthApp "$pkgdir/usr/bin/modrinth-app"
}
